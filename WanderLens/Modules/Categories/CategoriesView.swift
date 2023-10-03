//
//  CategoriesView.swift
//  WanderLens
//
//  Created by Telem Tobi on 03/10/2023.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject private var presenter: CategoriesPresenter
    
    init(presenter: CategoriesPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch presenter.state {
                case .loading:
                    ProgressView()
                    
                case .loaded(let categpories):
                    EmptyView()
                    
                case .error(let message):
                    Text(message ?? "An error occured")
                }
            }
            .navigationTitle("Categories")
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
    let interactor = CategoriesInteractor(interactable: AppController.Preview.interactor)
    let presenter = CategoriesPresenter(interactor: interactor, router: nil)
    
    return CategoriesView(presenter: presenter)
}
