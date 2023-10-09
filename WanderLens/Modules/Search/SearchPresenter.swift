//
//  SearchPresenter.swift
//  WanderLens
//
//  Created by Telem Tobi on 03/10/2023.
//

import SwiftUI
import Combine

@MainActor
class SearchPresenter: ObservableObject {
    
    enum State {
        case loading
        case loaded // TODO: Create a SearchResult struct
        case error(message: String?)
    }
    
    // MARK: -  Published Properties
    
    @Published var state: State = .loading
    @Published var alert: AlertType?
    
    // MARK: - Properties
    
    private let interactor: SearchInteractable
    private weak var router: SearchRouter?
    
    // MARK: - Proxies
    
    
    // MARK: - Initialiser
    
    init(interactor: SearchInteractable, router: SearchRouter?) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Methods
    
    func onFirstAppear() {
        
    }
    
    // MARK: - Private Methods
    

}
