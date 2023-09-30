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
    let isLargeView: Bool
    
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
            
            ZStack(alignment: .bottom) {
                
                
                HStack {
                    Label(photo.user?.location ?? "Unknown", systemImage: "mappin.circle")
                        .lineLimit(1)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Label((photo.likes ?? 0).description, systemImage: "heart")
                        .lineLimit(1)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                .padding()
                .background(
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.2)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .opacity(isLargeView ? 1 : 0)
        }
    }
}

#Preview {
    PhotoListItem(photo: .mock, isLargeView: true)
}
