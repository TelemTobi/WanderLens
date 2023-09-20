//
//  SearchRequest.swift
//  WanderLens
//
//  Created by Telem Tobi on 20/09/2023.
//

import Foundation

struct SearchRequest: Encodable {
    
    let query: String
    let page: Int?
    let perPage: Int = 100
    let order: Order?
    let collectionIds: [String]?
    let color: Color?
    let orientation: Orientation?
    
    enum CodingKeys: String, CodingKey {
        case query
        case page
        case perPage = "per_page"
        case order = "order_by"
        case collectionIds
        case color
        case orientation
    }
}

extension SearchRequest {
    
    enum Order: String, Encodable {
        case relevant
        case latest
    }
    
    enum Color: String, Encodable {
        case blackAndWhite = "black_and_white"
        case black
        case white
        case yellow
        case orange
        case red
        case purple
        case magenta
        case green
        case teal
        case blue
    }
    
    enum Orientation: String, Encodable {
        case landscape
        case portrait
        case squarish
    }
}
