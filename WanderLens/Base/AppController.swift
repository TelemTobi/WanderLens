//
//  AppController.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import UIKit

class AppController {
    
    private let appData: AppData
    private let interactor: Interactor
    private let coordinator: AppCoordinator
    
    init(window: UIWindow) {
        appData = AppData()
        interactor = Interactor(appData: appData)
        coordinator = AppCoordinator(window: window, interactor: interactor)
    }
}
