//
//  MainScreenView.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import SwiftUI

struct MainScreenView: View {
    
    @ObservedObject private var presenter: MainScreenPresenter
    
    @State private var selectedTab: Int = 0
    
    init(presenter: MainScreenPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            presenter.feedView
                .tag(0)
                .tabItem {
                    Label("Feed", systemImage: "house")
                }
            
            presenter.searchView
                .tag(1)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        .onFirstAppear(perform: presenter.onFirstAppear)
    }
}

#Preview {
    let interactor = MainScreenInteractor(interactable: AppController.Preview.interactor)
    let presenter = MainScreenPresenter(interactor: interactor, router: nil)

    return MainScreenView(presenter: presenter)
}
