//
//  CollectionsListView.swift
//  WanderLens
//
//  Created by Telem Tobi on 04/10/2023.
//

import SwiftUI

extension CollectionsView {
    
    struct ListView: View {
        
        let collections: [PhotoCollection]
        
        @State private var numberOfColumns: Int = 2
        @State private var currentScale: CGFloat = 1.0
        
        var body: some View {
            ScrollView(showsIndicators: false) {
                DynamicVGrid(columns: numberOfColumns, spacing: 30) {
                    ForEach(collections) { collection in
                        CollectionListItem(collection: collection)
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
    CollectionsView.ListView(collections: PhotoCollection.mock)
}
