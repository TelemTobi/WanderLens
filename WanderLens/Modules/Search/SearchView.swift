//
//  SearchView.swift
//  WanderLens
//
//  Created by Telem Tobi on 03/10/2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject private var presenter: SearchPresenter
    
    @State private var didShowSuggestionsView: Bool = false
    @State private var isSearching: Bool = false
    @State private var searchQuery: String = ""
    
    init(presenter: SearchPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            Group {
                if isSearching {
                    Text("Search Results")
                } else {
                    SuggestionsView(didFirstAppear: $didShowSuggestionsView)
                        .onFirstAppear {
                            didShowSuggestionsView = true
                        }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: toolbarContent)
            .searchable(
                text: $searchQuery,
                isPresented: $isSearching,
                placement: .navigationBarDrawer
            )
        }
    }
    
    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {

            } label: {
                Image(systemName: "heart.text.square")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

#Preview {
    let interactor = SearchInteractor(interactable: AppController.Preview.interactor)
    let presenter = SearchPresenter(interactor: interactor, router: nil)
    
    return SearchView(presenter: presenter)
}
