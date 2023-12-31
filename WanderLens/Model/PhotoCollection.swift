//
//  PhotoCollection.swift
//  WanderLens
//
//  Created by Telem Tobi on 24/09/2023.
//

import Foundation

struct PhotoCollection: Decodable, JsonResolver, Identifiable {
    
    let id: String?
    let title: String?
    let description: String?
    let creationDate: Date?
    let photosCount: Int?
    let coverPhoto: Photo?
    let previewPhotos: [Photo]?
    let user: User?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case creationDate = "published_at"
        case photosCount = "total_photos"
        case coverPhoto = "cover_photo"
        case previewPhotos = "preview_photos"
        case user
        case links
    }
}

extension PhotoCollection {
    
    struct Links: Decodable {
        let html: String?
        let photos: String?
        let related: String?
    }
}

#if DEBUG
extension PhotoCollection {
    
    static let mock: [PhotoCollection] = {
        try! JSONDecoder().decode([PhotoCollection].self, from: Mock.listCollections.dataEncoded)
    }()
}
#endif
