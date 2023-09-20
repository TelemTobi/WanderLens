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
    
    func searchPhotos(request: SearchRequest) async -> PhotosSearchCompletion {
        return await withCheckedContinuation { continuation in
            networkManager.request(.searchPhotos(request: request)) { (result: Result<PhotosSearchResponse, NetworkError>) in
                switch result {
                case .success(let response):
                    continuation.resume(returning: (response, nil))
                case .failure(let error):
                    continuation.resume(returning: (nil, error))
                }
            }
        }
    }
    
    func searchCollections(request: SearchRequest) async -> CollectionsSearchCompletion {
        return await withCheckedContinuation { continuation in
            networkManager.request(.searchPhotos(request: request)) { (result: Result<CollectionsSearchResponse, NetworkError>) in
                switch result {
                case .success(let response):
                    continuation.resume(returning: (response, nil))
                case .failure(let error):
                    continuation.resume(returning: (nil, error))
                }
            }
        }
    }
    
    func searchUsers(request: SearchRequest) async -> UsersSearchCompletion {
        return await withCheckedContinuation { continuation in
            networkManager.request(.searchPhotos(request: request)) { (result: Result<UsersSearchResponse, NetworkError>) in
                switch result {
                case .success(let response):
                    continuation.resume(returning: (response, nil))
                case .failure(let error):
                    continuation.resume(returning: (nil, error))
                }
            }
        }
    }
}
