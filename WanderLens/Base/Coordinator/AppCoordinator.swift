//
//  AppCoordinator.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import SwiftUI

// TODO: Come up with a better coordinator pattern for SwiftUI ⚠️

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    var interactor: Interactor
    var childCoordinators: [Coordinator] = []
    
    required init(window: UIWindow, interactor: Interactor) {
        self.window = window
        self.interactor = interactor
    }
    
    @MainActor
    func start() {
        
    }
    
    func finish() {
        
    }
}
