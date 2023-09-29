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

        @EnvironmentObject private var presenter: BrowsePresenter
        
        @State private var isSearching: Bool = false
        @State private var searchQuery: String = ""
        @State private var didShowSearchView: Bool = false
        
        var body: some View {
            Group {
                if isSearching {
                    SearchView(
                        didFirstAppear: $didShowSearchView,
                        locationSuggestions: presenter.locationSuggestions,
                        styleSuggestions: presenter.styleSuggestions
                    )
                } else {
                    ListView(photos: photos)
                }
            }
            .searchable(
                text: $searchQuery,
                isPresented: $isSearching,
                placement: .navigationBarDrawer
            )
        }
    }
}

#Preview {
    BrowseView.ContentView(photos: [])
}
