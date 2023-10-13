//
//  CollectionsListView.swift
//  WanderLens
//
//  Created by Telem Tobi on 09/10/2023.
//

import SwiftUI

struct CollectionsListView: View {
    
    let collections: [PhotoCollection]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Collections")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(collections) { collection in
                            CollectionListItem(collection: collection, geometry: geometry)
                        }
                    }
                    .scrollTargetLayout()
                    .padding(.horizontal, 16)
                }
                .scrollTargetBehavior(.viewAligned)
            }
            .frame(height: 240)
        }
    }
}

#Preview {
    CollectionsListView(collections: PhotoCollection.mock)
}
