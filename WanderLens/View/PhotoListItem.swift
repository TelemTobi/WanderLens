//
//  PhotoListItem.swift
//  WanderLens
//
//  Created by Telem Tobi on 29/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

protocol PhotoListItemDelegate: AnyObject {
    func savePhoto(_ photo: Photo)
}

struct PhotoListItem: View {
    
    let photo: Photo
    weak var delegate: PhotoListItemDelegate?
    
    var body: some View {
        WebImage(url: URL(string: photo.urls?.regular ?? ""))
            .resizable()
            .placeholder {
                Image(uiImage: .init(
                    blurHash: photo.blurHash ?? "",
                    size: .init(width: 4, height: 3)) ??
                    .init(systemName: "photo")!
                )
                .resizable()
            }
            .transition(.fade(duration: 0.2))
            .aspectRatio(photo.ratio, contentMode: .fit)
            .cornerRadius(5)
            .contextMenu(menuItems: {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Label("Like", systemImage: "heart")
                }
                Button(action: { delegate?.savePhoto(photo) }) {
                    Label("Save", systemImage: "arrowshape.down")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Label("More Details", systemImage: "info.circle")
                }
            })
    }
}

#Preview {
    PhotoListItem(photo: .mock, delegate: nil)
}
