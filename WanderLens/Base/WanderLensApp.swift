//
//  WanderLensApp.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import SwiftUI
import SDWebImage

@main
struct WanderLensApp: App {
    
    private let appController = AppController()
    
    var body: some Scene {
        WindowGroup {
            appController.rootView
        }
    }
}
