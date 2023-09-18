//
//  PredefinedError.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation

enum PredefinedError: Error {
    case connectionErrorNoNetwork, authErrorNotLoggedIn, unknownError, parseError, defaultError
    
    var localizedDescription: String {
        switch self {
        case .authErrorNotLoggedIn, .connectionErrorNoNetwork, .parseError, .unknownError, .defaultError:
            return "Something Went Wrong!" // TODO - Return a different error text for each error
        }
    }
}
