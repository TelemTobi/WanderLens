//
//  UnsplashEndpoints.swift
//  WanderLens
//
//  Created by Telem Tobi on 20/09/2023.
//

import Foundation
import Moya

enum UnsplashEndPoints {
    case searchPhotos(request: SearchRequest)
    case searchCollections(request: SearchRequest)
    case searchUsers(request: SearchRequest)
}

extension UnsplashEndPoints: TargetTypeEndPoint {
    
    var baseURL: URL { URL(string: Configurations.Unsplash.baseURL)! }
    
    var path: String {
        switch self {
        case .searchPhotos: return "/search/photos"
        case .searchCollections: return "/search/collections"
        case .searchUsers: return "/search/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchPhotos, .searchCollections, .searchUsers:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .searchPhotos(let request),
             .searchCollections(let request),
             .searchUsers(let request):
            
            guard let parameters = request.dictionary else { return .requestPlain }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .searchPhotos, .searchCollections, .searchUsers:
            return nil
        }
    }
    
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        switch self {
        case .searchPhotos, .searchCollections, .searchUsers:
            return .useDefaultKeys
        }
    }
    
    var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy {
        switch self {
        case .searchPhotos, .searchCollections, .searchUsers:
            return .iso8601
        }
    }
    
    #if DEBUG
    var shouldRequestStub: Bool {
        switch self {
        case .searchPhotos, .searchCollections, .searchUsers:
            return false
        }
    }
    
    var shouldPrintLogs: Bool {
        switch self {
        case .searchPhotos, .searchCollections, .searchUsers:
            return true
        }
    }
    #endif
}
