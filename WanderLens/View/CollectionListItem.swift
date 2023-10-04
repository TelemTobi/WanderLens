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
    let previewPhotos: [Photo?]
    
    init(collection: PhotoCollection) {
        self.collection = collection
        self.previewPhotos = Array(collection.previewPhotos?.prefix(3) ?? [])
    }
    
    var body: some View {
        ZStack {
            ForEach(Array(previewPhotos.enumerated()), id: \.offset) { index, photo in
                imageView(for: photo)
//                    .rotationEffect(rotationAngle(for: index), anchor: .bottomTrailing)
                    .scaleEffect(scale(for: index))
                    .offset(y: yOffset(for: index))
//                    .opacity(opacity(for: index))
            }
        }
        .contextMenu(menuItems: {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Label("Like", systemImage: "heart")
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Label("More Details", systemImage: "info.circle")
            }
        })
    }
    
    private func imageView(for photo: Photo?) -> some View {
        WebImage(url: URL(string: photo?.urls?.regular ?? ""))
            .resizable()
            .placeholder {
                Image(uiImage: .init(
                    blurHash: photo?.blurHash ?? "",
                    size: .init(width: 4, height: 3)) ??
                    .init(systemName: "photo.stack")!
                )
                .resizable()
            }
            .transition(.fade(duration: 0.2))
            .aspectRatio(collection.coverPhoto?.ratio ?? 1, contentMode: .fit)
            .cornerRadius(5)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.secondary.opacity(0.5), lineWidth: 1)
            }
    }
    
    private func yOffset(for index: Int) -> CGFloat {
        let reversedIndex = CGFloat((previewPhotos.count - 1) - index)
        return CGFloat(reversedIndex) * -10
    }
    
    private func rotationAngle(for index: Int) -> Angle {
        let reversedIndex = CGFloat((previewPhotos.count - 1) - index)
        return .degrees(reversedIndex * 5)
    }
    
    private func scale(for index: Int) -> CGSize {
        let reversedIndex = CGFloat((previewPhotos.count - 1) - index)
        let scaleValue = 1 - (reversedIndex * 0.1)
        return .init(width: scaleValue, height: scaleValue)
    }
    
    private func opacity(for index: Int) -> CGFloat {
        let reversedIndex = CGFloat((previewPhotos.count - 1) - index)
        return 1 - (reversedIndex * 0.05)
    }
}

#Preview {
    CollectionListItem(collection: PhotoCollection.mock[0])
}
