//
//  FeedView.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject private var presenter: FeedPresenter
    
    init(presenter: FeedPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationStack {
            Group {
                switch presenter.state {
                case .loading:
                    ProgressView()
                    
                case .loaded(let collections, let photos):
                    ContentView(collections: collections, photos: photos)
                        .environmentObject(presenter)
                    
                case .error(let message):
                    ContentUnavailableView {
                        Label("Something went wrong", systemImage: "exclamationmark.triangle")
                    } description: {
                        Text(message ?? "An error occured")
                    } actions: {
                        Button("Retry") {
                            presenter.retry()
                        }
                    }
                }
            }
            .navigationTitle("Feed")
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
    let interactor = FeedInteractor(interactable: AppController.Preview.interactor)
    let presenter = FeedPresenter(interactor: interactor, router: nil)
    
    return FeedView(presenter: presenter)
}
