//
//  BrowseListView.swift
//  WanderLens
//
//  Created by Telem Tobi on 29/09/2023.
//

import SwiftUI

extension BrowseView {
    
    struct ListView: View {
        
        let photos: [Photo]
        
        @State private var numberOfColumns: Int = 2
        @State private var currentScale: CGFloat = 1.0
        
        var body: some View {
            ScrollView(showsIndicators: false) {
                DynamicVGrid(columns: numberOfColumns) {
                    ForEach(photos) { photo in
                        PhotoListItem(photo: photo, isLargeView: numberOfColumns == 1)
                    }
                }
                .padding()
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
    BrowseView.ListView(photos: Array(repeating: Photo.mock, count: 10))
}