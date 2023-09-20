//
//  Authenticating.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation
import Moya

enum AuthState {
    case reachable, noReachable, notLoggedIn
}

protocol Authenticating {
    var accessKey: String? { get }
    var authState: AuthState { get }

    // Can be used to asynchronously authenticate the user
    func authenticate(with completion: @escaping SuccessCompletion) throws
    
    // Can be used to map the endpoint right before the request is excecuted
    func mapEndpoint(_ endpoint: Endpoint, for target: TargetTypeEndPoint) -> Endpoint
}
