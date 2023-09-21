//
//  DataProviders.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import Foundation

class DataProviders {
    
    private let appData: AppData
    let unsplash: UnsplashDataProvider
    
    init(appData: AppData) {
        self.appData = appData
        self.unsplash = UnsplashDataProvider(appData: appData)
    }
}
