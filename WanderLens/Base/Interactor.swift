//
//  Interactor.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import Foundation

class Interactor {
    
    typealias Dependencies = (
        appData: AppData,
        services: Services,
        dataProviders: DataProviders
    )
    
    let appData: AppData
    let services: Services
    let dataProviders: DataProviders
    
    init(appData: AppData) {
        self.appData = appData
        self.services = Services()
        self.dataProviders = DataProviders(appData: appData)
    }
}
