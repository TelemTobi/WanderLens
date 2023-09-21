//
//  Interactor.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import Foundation

protocol Interactable {
    var appData: AppData { get }
    var services: Services { get }
    var dataProviders: DataProviders { get }
}

class Interactor: Interactable {
    
    let appData: AppData
    let services: Services
    let dataProviders: DataProviders
    
    init(appData: AppData, services: Services, dataProviders: DataProviders) {
        self.appData = appData
        self.services = services
        self.dataProviders = dataProviders
    }
    
    init(interactable: Interactable) {
        self.appData = interactable.appData
        self.services = interactable.services
        self.dataProviders = interactable.dataProviders
    }
}
