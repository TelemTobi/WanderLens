//
//  PhotosListView.swift
//  WanderLens
//
//  Created by Telem Tobi on 09/10/2023.
//

import SwiftUI

struct PhotosListView: View {

    let photos: [Photo]
    @Binding var selectedIndex: Int?
    let namespace: Namespace.ID
    
    @EnvironmentObject private var presenter: FeedPresenter
    @State private var numberOfColumns: Int = 2
    @State private var currentScale: CGFloat = 1.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Popular Photos")
                .font(.title)
                .fontWeight(.semibold)
            
            DynamicVGrid(columns: numberOfColumns) {
                ForEach(Array(photos.enumerated()), id: \.offset) { index, photo in
                    PhotoListItem(photo: photo, delegate: presenter)
                        .matchedGeometryEffect(id: index.description, in: namespace, isSource: selectedIndex == nil)
                        .onTapGesture {
                            withAnimation { selectedIndex = index }
                        }
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
        .padding(.horizontal)
    }
}

#Preview {
    @Namespace var namespace
    
    return PhotosListView(photos: Photo.mock, selectedIndex: .constant(nil), namespace: namespace)
}
