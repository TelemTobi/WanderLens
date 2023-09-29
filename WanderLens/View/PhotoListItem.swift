//
//  PhotoListItem.swift
//  WanderLens
//
//  Created by Telem Tobi on 29/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotoListItem: View {
    
    let photo: Photo
    @State var isLargeView: Bool
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
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
            
            if isLargeView {
                Text("Hello")
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    PhotoListItem(photo: .mock, isLargeView: true)
}
