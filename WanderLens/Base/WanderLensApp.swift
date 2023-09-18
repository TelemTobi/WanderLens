//
//  WanderLensApp.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import SwiftUI

@main
struct WanderLensApp: App {
    
    lazy var appController: AppController = {
        guard let window = UIWindow.main else { fatalError("No window found!") }
        return AppController(window: window)
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
