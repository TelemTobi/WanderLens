//
//  Authenticating.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation

enum AuthState {
    case reachable, noReachable, notLoggedIn
}

protocol Authenticating {
    var authState: AuthState { get }
    
    var accessToken: String? { get }
    func authenticate(with completion: @escaping SuccessCompletion) throws
    func authenticate(_ request: URLRequest, done: @escaping (URLRequest) -> Void)
}
