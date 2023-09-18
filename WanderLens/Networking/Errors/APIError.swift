//
//  APIError.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Foundation

struct APIError: Errorable {

    enum StatusCode: Int, RawRepresentable, Codable {
        case predefined = -1
    }
    
    let statusCode: StatusCode?
    let developerMessage: String?
    
    var debugDescription: String {
        developerMessage ?? "Could not get any error message from response"
    }
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case developerMessage = "status_message"
    }
    
    init(errorType: PredefinedError?) {
        statusCode = .predefined
        developerMessage = errorType?.localizedDescription
    }
}
