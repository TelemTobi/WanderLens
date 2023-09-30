//
//  BrowseView.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import SwiftUI

struct BrowseView: View {
    
    @ObservedObject private var presenter: BrowsePresenter
    
    init(presenter: BrowsePresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch presenter.state {
                case .loading:
                    ProgressView()
                    
                case .loaded(let photos):
                    ContentView(photos: photos)
                        .environmentObject(presenter)
                    
                case .error(let message):
                    Text(message ?? "An error occured")
                }
            }
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: toolbarContent)
        }
        .onFirstAppear(perform: presenter.onFirstAppear)
    }
    
    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {

            } label: {
                Image(systemName: "eyes")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

#Preview {
    let interactor = BrowseInteractor(interactable: AppController.Preview.interactor)
    let presenter = BrowsePresenter(interactor: interactor, router: nil)
    
    return BrowseView(presenter: presenter)
}
