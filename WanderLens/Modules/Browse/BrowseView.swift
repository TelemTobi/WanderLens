//
//  BrowseView.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import SwiftUI

struct BrowseView: View {
    
    @ObservedObject private var presenter: BrowsePresenter
    
    @State private var isMapShowing: Bool = false
    @State private var searchQuery: String = ""
    
    init(presenter: BrowsePresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            switch presenter.state {
            case .loading:
                ProgressView()
                
            case .loaded(let photos):
                ScrollView(showsIndicators: false) {
                    Color.white
                        .frame(height: 1000)
                }
                .navigationTitle("Browse")
                .toolbar(content: toolbarContent)
                .searchable(
                    text: $searchQuery,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "What are you looking for..?"
                )
                
            case .error(let message):
                Text(message ?? "An error occured")
            }
        }
        .onFirstAppear(perform: presenter.onFirstAppear)
    }
    
    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                isMapShowing.toggle()
            } label: {
                Image(systemName: isMapShowing ? "square.grid.2x2" : "map")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    
    static var previews: some View {
        let interactor = BrowseInteractor(interactable: AppController.Preview.interactor)
        let presenter = BrowsePresenter(interactor: interactor, router: nil)
        
        BrowseView(presenter: presenter)
    }
}
