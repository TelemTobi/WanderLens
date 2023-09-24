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
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Browse")
                .tabItem {
                    Label("Browse", systemImage: "globe.americas")
                }
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .onFirstAppear(perform: presenter.onFirstAppear)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    
    static var previews: some View {
        let interactor = MainScreenInteractor(interactable: AppController.Preview.interactor)
        let presenter = MainScreenPresenter(interactor: interactor, router: nil)
        
        MainScreenView(presenter: presenter)
    }
}
