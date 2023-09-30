//
//  User.swift
//  WanderLens
//
//  Created by Telem Tobi on 24/09/2023.
//

import Foundation

struct User: Decodable, JsonResolver {
    
    let id: String?
    let username: String
    let name: String?
    let bio: String?
    let location: String?
    let likeCount: Int?
    let photoCount: Int?
    let collectionCount: Int?
    let profileImage: ProfileImage?
    let links: Links?
    let social: Social?
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case bio
        case location
        case likeCount = "total_likes"
        case photoCount = "total_photos"
        case collectionCount = "total_collections"
        case profileImage = "profile_image"
        case links
        case social
    }
}

extension User {
    
    struct ProfileImage: Decodable {
        let small: String?
        let medium: String?
        let large: String?
    }
    
    struct Links: Decodable {
        let html: String?
        let photos: String?
        let likes: String?
        let portfolio: String?
    }
    
    struct Social: Decodable {
        let instagramUsername: String?
        let twitterUsername: String?
        
        enum CodingKeys: String, CodingKey {
            case instagramUsername = "instagram_username"
            case twitterUsername = "twitter_username"
        }
    }
}

#if DEBUG
extension User {
    static let mock: User = .init(
        id: "J4_bsR1axWg",
        username: "turner_imagery",
        name: "Will Turner",
        bio: "Just a man with a camera.\r\n\r\nCheck out my instagram @turner_imagery",
        location: "Tel Aviv, Israel",
        likeCount: 23,
        photoCount: 94,
        collectionCount: 3,
        profileImage: .init(
            small: "https://images.unsplash.com/profile-1515991318621-20a8557885ed?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32",
            medium: "https://images.unsplash.com/profile-1515991318621-20a8557885ed?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64",
            large: "https://images.unsplash.com/profile-1515991318621-20a8557885ed?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128"),
        links: .init(
            html: "https://unsplash.com/@turner_imagery",
            photos: "https://api.unsplash.com/users/turner_imagery/photos",
            likes: "https://api.unsplash.com/users/turner_imagery/likes",
            portfolio: "https://api.unsplash.com/users/turner_imagery/portfolio"),
        social: .init(
            instagramUsername: "turner_imagery",
            twitterUsername: nil)
    )
}
#endif
