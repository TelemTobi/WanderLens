//
//  CollectionsView.swift
//  WanderLens
//
//  Created by Telem Tobi on 03/10/2023.
//

import SwiftUI

struct CollectionsView: View {
    
    @ObservedObject private var presenter: CollectionsPresenter
    
    init(presenter: CollectionsPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch presenter.state {
                case .loading:
                    ProgressView()
                    
                case .loaded(let collections):
                    ContentView(collections: collections)
                        .environmentObject(presenter)
                    
                case .error(let message):
                    Text(message ?? "An error occured")
                }
            }
            .navigationTitle("Collections")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: toolbarContent)
        }
        .onFirstAppear(perform: presenter.onFirstAppear)
        .alert(type: $presenter.alert)
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
    let interactor = CollectionsInteractor(interactable: AppController.Preview.interactor)
    let presenter = CollectionsPresenter(interactor: interactor, router: nil)
    
    return CollectionsView(presenter: presenter)
}
