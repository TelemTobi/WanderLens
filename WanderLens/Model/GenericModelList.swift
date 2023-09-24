//
//  GenericModelList.swift
//  WanderLens
//
//  Created by Telem Tobi on 24/09/2023.
//

import Foundation

struct GenericModelList<Model>: Decodable, JsonResolver where Model: Decodable {
    
    let list: [Model]?
    
    enum CodingKeys: CodingKey {
        case list
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<GenericModelList<Model>.CodingKeys> = try decoder.container(keyedBy: GenericModelList<Model>.CodingKeys.self)
        self.list = try container.decodeIfPresent([Model].self, forKey: GenericModelList<Model>.CodingKeys.list)
    }
}
