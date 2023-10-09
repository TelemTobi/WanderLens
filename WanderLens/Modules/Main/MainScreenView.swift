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
            presenter.browseView
                .tag(0)
                .tabItem {
                    Label("Browse", systemImage: "globe.americas")
                }
            
            presenter.searchView
                .tag(1)
                .tabItem {
                    Label("Collections", systemImage: "photo.stack")
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
