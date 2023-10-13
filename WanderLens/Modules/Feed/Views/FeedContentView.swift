//
//  FeedListView.swift
//  WanderLens
//
//  Created by Telem Tobi on 29/09/2023.
//

import SwiftUI

extension FeedView {
    
    struct ContentView: View {
        
        let collections: [PhotoCollection]
        let photos: [Photo]
        
        @EnvironmentObject private var presenter: FeedPresenter
        
        var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    CollectionsListView(collections: collections)
                    
                    PhotosListView(photos: photos)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    FeedView.ContentView(collections: PhotoCollection.mock, photos: Photo.mock)
}
