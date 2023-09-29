//
//  BrowseConentView.swift
//  WanderLens
//
//  Created by Telem Tobi on 29/09/2023.
//

import SwiftUI

extension BrowseView {
    
    struct ContentView: View {
        
        let photos: [Photo]
        
        @Environment(\.isSearching) private var isSearching
        
        var body: some View {
            Group {
                if isSearching {
                    SearchView()
                } else {
                    ListView(photos: photos)
                }
            }
        }
    }
}

#Preview {
    BrowseView.ContentView(photos: [])
}
