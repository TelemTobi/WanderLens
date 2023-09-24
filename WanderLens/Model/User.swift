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
