//
//  AppController.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import Foundation
import SwiftUI

class AppController {
    
    private let interactor: Interactor
    private let coordinator: AppCoordinator
    
    init() {
        let appData = AppData()
        let services = Services()
        let dataProviders = DataProviders(appData: appData)
        
        interactor = Interactor(appData: appData, services: services, dataProviders: dataProviders)
        coordinator = AppCoordinator(interactor: interactor)
    }
    
    @MainActor
    var rootView: some View {
        coordinator.mainScreenView
    }
}

#if DEBUG
extension AppController {
    
    enum Preview {
        
        static var interactor: Interactor {
            let appData = AppData()
            return Interactor(
                appData: appData,
                services: Services(),
                dataProviders: DataProviders(appData: appData)
            )
        }
        
    }
}
#endif
