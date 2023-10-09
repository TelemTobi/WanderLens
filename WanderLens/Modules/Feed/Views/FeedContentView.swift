//
//  FeedListView.swift
//  WanderLens
//
//  Created by Telem Tobi on 29/09/2023.
//

import SwiftUI

extension FeedView {
    
    struct ContentView: View {
        
        let photos: [Photo]
        
        @EnvironmentObject private var presenter: FeedPresenter
        
        var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    CollectionsView()
                    
                    PopularPhotosView(photos: photos)
                }
                .padding()
            }
        }
    }
}

#Preview {
    FeedView.ContentView(photos: Photo.mock)
}
