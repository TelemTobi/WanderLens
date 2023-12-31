//
//  UnsplashDataProvider.swift
//  WanderLens
//
//  Created by Telem Tobi on 20/09/2023.
//

import Foundation
import Moya

class UnsplashDataProvider: DataProviding {
    
    typealias NetworkError = APIError
    
    private let appData: AppData
    private let networkManager: NetworkManager<UnsplashEndPoints, NetworkError>
    
    init(appData: AppData) {
        self.appData = appData
        self.networkManager = NetworkManager<UnsplashEndPoints, NetworkError>(authenticator: UnsplashAuthenticator())
    }
    
    func listPhotos(request: ListRequest) async -> PhotosListCompletion {
        return await withCheckedContinuation { continuation in
            networkManager.request(.listPhotos(request: request)) { (result: Result<[Photo], NetworkError>) in
                switch result {
                case .success(let response):
                    continuation.resume(returning: (response, nil))
                case .failure(let error):
                    continuation.resume(returning: (nil, error))
                }
            }
        }
    }
    
    func listCollections(request: ListRequest) async -> CollectionsListCompletion {
        return await withCheckedContinuation { continuation in
            networkManager.request(.listCollections(request: request)) { (result: Result<[PhotoCollection], NetworkError>) in
                switch result {
                case .success(let response):
                    continuation.resume(returning: (response, nil))
                case .failure(let error):
                    continuation.resume(returning: (nil, error))
                }
            }
        }
    }
    
    func searchPhotos(request: SearchRequest, completion: @escaping PhotosSearchCompletion) {
        networkManager.request(.searchPhotos(request: request)) { (result: Result<PhotosSearchResponse, NetworkError>) in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func searchCollections(request: SearchRequest, completion: @escaping CollectionsSearchCompletion) {
        networkManager.request(.searchPhotos(request: request)) { (result: Result<CollectionsSearchResponse, NetworkError>) in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func searchUsers(request: SearchRequest, completion: @escaping UsersSearchCompletion) {
        networkManager.request(.searchPhotos(request: request)) { (result: Result<UsersSearchResponse, NetworkError>) in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
