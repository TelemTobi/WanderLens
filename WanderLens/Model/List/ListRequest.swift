//
//  ListRequest.swift
//  WanderLens
//
//  Created by Telem Tobi on 24/09/2023.
//

import Foundation

struct ListRequest: Encodable {
    
    let page: Int?
    let perPage: Int = 100
    let order: Order?
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case order = "order_by"
    }
}

extension ListRequest {
    
    enum Order: String, Encodable {
        case latest
        case oldest
        case popularity = "popular"
    }
}
