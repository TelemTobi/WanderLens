//
//  CollectionsContentView.swift
//  WanderLens
//
//  Created by Telem Tobi on 04/10/2023.
//

import SwiftUI

extension CollectionsView {
    
    struct ContentView: View {
        
        let collections: [PhotoCollection]

        @EnvironmentObject private var presenter: CollectionsPresenter
        
        @State private var isSearching: Bool = false
        @State private var searchQuery: String = ""
        @State private var didShowSearchView: Bool = false
        
        var body: some View {
            Group {
                if isSearching {
                    SearchView(didFirstAppear: $didShowSearchView)
                } else {
                    ListView(collections: collections)
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
