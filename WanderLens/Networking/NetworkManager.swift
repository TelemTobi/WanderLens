//
//  NetworkManager.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation
import Moya

class NetworkManager<E: TargetTypeEndPoint, F: Errorable>: Networking {
    
    typealias EndPoint = E
    
    private var authenticator: Authenticating
    internal var provider: MoyaProvider<EndPoint>?
    internal var stubbingProvider: MoyaProvider<EndPoint>?
    
    init(authenticator: Authenticating) {
        self.authenticator = authenticator
        configure()
    }
    
    private func configure() {
        
        let requestClosure: MoyaProvider<EndPoint>.RequestClosure = { [unowned self] (endpoint: Endpoint, done: @escaping MoyaProvider.RequestResultClosure) in
            guard let request = try? endpoint.urlRequest() else { return }
            
            self.authenticator.authenticate(request, done: { request in
                done(.success(request))
            })
        }
        
        provider = MoyaProvider<EndPoint>(requestClosure: requestClosure)
        stubbingProvider = MoyaProvider<EndPoint>(stubClosure: MoyaProvider.delayedStub(Constants.TimeInterval.stubDelay))
    }
    
    func request<T, F: Errorable>(_ endpoint: EndPoint, completion: @escaping (Result<T, F>) -> Void) where T: Codable, T: JsonResolver {
        
        guard endpoint.shouldRequestStub == false else {
            makeStubRequest(endpoint, completion: completion)
            return
        }
        
        switch authenticator.authState {
        case .noReachable:
            completion(.failure(.init(errorType: .connectionErrorNoNetwork)))
            return
        case .notLoggedIn:
            completion(.failure(.init(errorType: .authErrorNotLoggedIn)))
            return
        case .reachable: break
        }
        
        do {
            try authenticator.authenticate { [unowned self, endpoint, completion] success in
                
                if success {
                    self.makeRequest(endpoint, completion: completion)
                } else {
                    completion(.failure(.init(errorType: .authErrorNotLoggedIn)))
                }
            }
        } catch {
            completion(.failure(.init(errorType: .connectionErrorNoNetwork)))
        }
    }
    
    private func makeRequest<T: Parsable, F: Errorable>(_ endpoint: EndPoint, completion: @escaping (Result<T, F>) -> Void) {
        
        guard let provider = provider else { return }
        
        provider.request(endpoint) { [weak self, endpoint = endpoint] result in
            
            switch result {
            case .success(let response):
                do {
                    if response.statusCode.isError {
                        self?.handleError(endpoint, response: response, completion: completion)
                        return
                    }
                    
                    if endpoint.shouldPrintLogs { response.printSuccessfulResponse() }
                    
                    let model: T = try T
                        .resolve(response.data)
                        .parse(type: T.self, dateDecodingStrategy: endpoint.dateDecodingStrategy, keyDecodingStrategy: endpoint.keyDecodingStrategy)
                    completion(.success(model))
                } catch {
                    self?.handleError(endpoint, response: response, error: error, completion: completion)
                }
            case .failure:
                completion(.failure(.init(errorType: .unknownError)))
            }
        }
    }
    
    private func handleError<T: Parsable, F: Errorable>(_ endpoint: EndPoint, response: Response, error: Error? = nil, completion: @escaping (Result<T, F>) -> Void) {
        
        #if DEBUG
        if let error, error.isDecodingError {
            error.printDecodingError()
            return
        } else if endpoint.shouldPrintLogs {
            response.printErrorResponse(with: error)
        }
        #endif
        
        if let error = try? F.self
            .resolve(response.data)
            .parse(type: F.self, dateDecodingStrategy: endpoint.dateDecodingStrategy, keyDecodingStrategy: endpoint.keyDecodingStrategy) {
            completion(.failure(error))
        } else {
            completion(.failure(.init(errorType: .parseError)))
        }
    }
}
