//
//  MainScreenView.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import SwiftUI

struct MainScreenView: View {
    
    @ObservedObject private var presenter: MainScreenPresenter
    
    init(presenter: MainScreenPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MainScreenView_Previews: PreviewProvider {
    
    static var previews: some View {
        let interactor = MainScreenInteractor(interactable: AppController.Preview.interactor)
        let presenter = MainScreenPresenter(interactor: interactor, router: nil)
        
        MainScreenView(presenter: presenter)
    }
}
