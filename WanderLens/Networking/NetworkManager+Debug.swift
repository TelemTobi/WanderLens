//
//  NetworkManager+Debug.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation
import Moya

#if DEBUG
extension NetworkManager {
    
    /**
     Requests a mock of model parsed from hardcoded JSON, and optionaly notify the result with a delay.
     - parameter endpoint: The endpoint the function should mock.
     - parameter completion: A closure called when result of codable type is ready.
     */
    func makeStubRequest<T: Parsable, F: Errorable>(_ endpoint: EndPoint, completion: @escaping (Result<T, F>) -> Void) {
        
        guard let stubbingProvider = stubbingProvider else {
            completion(.failure(.init(errorType: .unknownError)))
            return
        }

        stubbingProvider.request(endpoint) { [endpoint = endpoint] result in
            
            switch result {
            case .success(let response):
                do {
                    endpoint.shouldPrintLogs ? response.printSuccessfulResponse() : nil
                    
                    let model: T = try T
                        .resolve(response.data)
                        .parse(type: T.self, dateDecodingStrategy: endpoint.dateDecodingStrategy, keyDecodingStrategy: endpoint.keyDecodingStrategy)
                    completion(.success(model))
                } catch {
                    if let error = try? response.data.parse(type: F.self, dateDecodingStrategy: endpoint.dateDecodingStrategy, keyDecodingStrategy: endpoint.keyDecodingStrategy) {
                        completion(.failure(error))
                    } else {
                        completion(.failure(.init(errorType: PredefinedError.parseError)))
                    }
                }
                
            case .failure:
                completion(.failure(.init(errorType: .unknownError)))
            }
        }
    }
}
#endif
