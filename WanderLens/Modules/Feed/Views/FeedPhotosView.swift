//
//  FeedPhotosView.swift
//  WanderLens
//
//  Created by Telem Tobi on 09/10/2023.
//

import SwiftUI

extension FeedView {
    struct PopularPhotosView: View {

        let photos: [Photo]
        
        @EnvironmentObject private var presenter: FeedPresenter
        @State private var numberOfColumns: Int = 2
        @State private var currentScale: CGFloat = 1.0
        
        var body: some View {
            Text("Popular Photos")
                .font(.title)
                .fontWeight(.semibold)
            
            DynamicVGrid(columns: numberOfColumns) {
                ForEach(photos) { photo in
                    PhotoListItem(photo: photo, delegate: presenter)
                }
            }
            .gesture(
                MagnifyGesture()
                    .onChanged { scale in
                        if numberOfColumns == 2, scale.magnification > currentScale {
                            withAnimation { numberOfColumns = 1 }
                            
                        } else if numberOfColumns == 1, scale.magnification < currentScale {
                            withAnimation { numberOfColumns = 2 }
                        }
                        
                        currentScale = scale.magnification
                    }
            )
        }
    }
}

#Preview {
    FeedView.PopularPhotosView(photos: Photo.mock)
}
