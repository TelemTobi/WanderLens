//
//  Photo.swift
//  WanderLens
//
//  Created by Telem Tobi on 24/09/2023.
//

import Foundation

struct Photo: Decodable, JsonResolver {
    
    let id: String?
    let creationDate: Date?
    let width: Double?
    let height: Double?
    let color: String?
    let blurHash: String?
    let likes: Int?
    let description: String?
    let user: User?
    let urls: Urls?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case id
        case creationDate = "created_at"
        case width
        case height
        case color
        case blurHash = "blur_hash"
        case likes
        case description
        case user
        case urls
        case links
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
