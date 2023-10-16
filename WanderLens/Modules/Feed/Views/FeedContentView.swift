//
//  FeedListView.swift
//  WanderLens
//
//  Created by Telem Tobi on 29/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

extension FeedView {
    
    struct ContentView: View {
        
        let collections: [PhotoCollection]
        let photos: [Photo]
        
        @EnvironmentObject private var presenter: FeedPresenter
        @State private var selectedIndex: Int?
        @Namespace var namespace
        
        var body: some View {
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 30) {
                        CollectionsListView(collections: collections)
                        
                        PhotosListView(photos: photos, selectedIndex: $selectedIndex, namespace: namespace)
                    }
                    .padding(.vertical)
                }
                
                if let selectedIndex {
                    DetailView(
                        photo: photos[selectedIndex],
                        id: selectedIndex.description,
                        namespace: namespace
                    )
                    .onTapGesture {
                        withAnimation { self.selectedIndex = nil }
                    }
                }
            }
            .toolbar(selectedIndex == nil ? .visible : .hidden, for: .navigationBar)
        }
        
        private struct DetailView: View {
            
            let photo: Photo
            let id: String
            let namespace: Namespace.ID
            
            var body: some View {
                ZStack {
                    Color.white
                        .ignoresSafeArea()
                    
                    WebImage(url: URL(string: photo.urls?.regular ?? ""))
                        .resizable()
                        .matchedGeometryEffect(id: id, in: namespace)
                        .aspectRatio(photo.ratio, contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    FeedView.ContentView(collections: PhotoCollection.mock, photos: Photo.mock)
}
