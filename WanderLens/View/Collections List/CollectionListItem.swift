//
//  CollectionListItem.swift
//  WanderLens
//
//  Created by Telem Tobi on 04/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CollectionListItem: View {
    
    let collection: PhotoCollection
    let geometry: GeometryProxy
    
    var body: some View {
        let coverPhoto = collection.coverPhoto
            
        GeometryReader { itemGeometry in
            let itemSize = itemGeometry.size
            let minX = itemGeometry.frame(in: .scrollView).minX * 0.5
            
            WebImage(url: URL(string: coverPhoto?.urls?.regular ?? ""))
                .resizable()
                .placeholder {
                    Image(uiImage: .init(
                        blurHash: coverPhoto?.blurHash ?? "",
                        size: .init(width: 4, height: 3)) ??
                        .init(systemName: "photo")!
                    )
                    .resizable()
                }
                .transition(.fade(duration: 0.2))
                .aspectRatio(contentMode: .fill)
                .scaleEffect(1.2)
                .offset(x: -minX)
                .frame(width: itemSize.width, height: itemSize.height)
                .overlay { OverlayView(for: collection) }
                .clipShape(.rect(cornerRadius: 10))
        }
        .frame(width: geometry.size.width - 32)
        .scrollTransition(.interactive, axis: .horizontal) { view, phase in
            view
                .scaleEffect(phase.isIdentity ? 1 : 0.95)
        }
    }
    
    private func OverlayView(for collection: PhotoCollection) -> some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [.clear, .clear, .clear, .black.opacity(0.1), .black.opacity(0.4), .black.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack(alignment: .leading) {
                Text(collection.title ?? "")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                
                if let description = collection.description {
                    Text(description)
                        .font(.callout)
                        .foregroundStyle(.white.opacity(0.8))
                        .lineLimit(1)
                }
            }
            .padding()
        }
    }
}
