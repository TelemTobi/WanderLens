//
//  Photo.swift
//  WanderLens
//
//  Created by Telem Tobi on 24/09/2023.
//

import Foundation
import SwiftData

struct Photo: Decodable, JsonResolver, Identifiable {
    
    let id: String?
    let creationDate: Date?
    let width: Double?
    let height: Double?
    let color: String?
    let blurHash: String?
    let likes: Int?
    let summary: String?
    let user: User?
    let urls: Urls?
    let links: Links?
    
    var ratio: Double {
         (width ?? 1) / (height ?? 1)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case creationDate = "created_at"
        case width
        case height
        case color
        case blurHash = "blur_hash"
        case likes
        case summary = "description"
        case user
        case urls
        case links
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.creationDate = try container.decodeIfPresent(Date.self, forKey: .creationDate)
        self.width = try container.decodeIfPresent(Double.self, forKey: .width)
        self.height = try container.decodeIfPresent(Double.self, forKey: .height)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        self.blurHash = try container.decodeIfPresent(String.self, forKey: .blurHash)
        self.likes = try container.decodeIfPresent(Int.self, forKey: .likes)
        self.summary = try container.decodeIfPresent(String.self, forKey: .summary)
        self.user = try container.decodeIfPresent(User.self, forKey: .user)
        self.urls = try container.decodeIfPresent(Photo.Urls.self, forKey: .urls)
        self.links = try container.decodeIfPresent(Photo.Links.self, forKey: .links)
    }
}

extension Photo {
    
    struct Urls: Decodable {
        let raw: String?
        let full: String?
        let regular: String?
        let small: String?
        let thumb: String?
    }
    
    struct Links: Decodable {
        let html: String?
        let download: String?
    }
}

#if DEBUG
extension Photo {
    
    static let mock: [Photo] = {
        try! JSONDecoder().decode([Photo].self, from: Mock.listPhotos.dataEncoded)
    }()
}
#endif
