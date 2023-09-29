//
//  Photo.swift
//  WanderLens
//
//  Created by Telem Tobi on 24/09/2023.
//

import Foundation

struct Photo: Decodable, JsonResolver, Identifiable {
    
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

#if DEBUG
extension Photo {
    static let mock: Photo = .init(
        id: "GRLN5FC4cLg", 
        creationDate: Date.now, 
        width: 2992,
        height: 3992,
        color: "#262626",
        blurHash: "LKCr=#~VNat7X-%M%1j?9tNbxaay", 
        likes: 687,
        description: "high angle photography of cliff",
        user: .mock,
        urls: .init(
            raw: "https://images.unsplash.com/photo-1552300977-cbc8b08d95e7?ixid=M3w1MDQ4OTR8MHwxfGFsbHwxMnx8fHx8fDF8fDE2OTU2NDM4NTN8&ixlib=rb-4.0.3",
            full: "https://images.unsplash.com/photo-1552300977-cbc8b08d95e7?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1MDQ4OTR8MHwxfGFsbHwxMnx8fHx8fDF8fDE2OTU2NDM4NTN8&ixlib=rb-4.0.3&q=85",
            regular: "https://images.unsplash.com/photo-1552300977-cbc8b08d95e7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MDQ4OTR8MHwxfGFsbHwxMnx8fHx8fDF8fDE2OTU2NDM4NTN8&ixlib=rb-4.0.3&q=80&w=1080",
            small: "https://images.unsplash.com/photo-1552300977-cbc8b08d95e7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MDQ4OTR8MHwxfGFsbHwxMnx8fHx8fDF8fDE2OTU2NDM4NTN8&ixlib=rb-4.0.3&q=80&w=400",
            thumb: "https://images.unsplash.com/photo-1552300977-cbc8b08d95e7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MDQ4OTR8MHwxfGFsbHwxMnx8fHx8fDF8fDE2OTU2NDM4NTN8&ixlib=rb-4.0.3&q=80&w=200"),
        links: .init(
            html: "https://unsplash.com/photos/GRLN5FC4cLg",
            download: "https://unsplash.com/photos/GRLN5FC4cLg/download?ixid=M3w1MDQ4OTR8MHwxfGFsbHwxMnx8fHx8fDF8fDE2OTU2NDM4NTN8")
    )
}
#endif
