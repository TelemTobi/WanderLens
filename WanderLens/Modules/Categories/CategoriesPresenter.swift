//
//  CategoriesPresenter.swift
//  WanderLens
//
//  Created by Telem Tobi on 03/10/2023.
//

import SwiftUI
import Combine

@MainActor
class CategoriesPresenter: ObservableObject {
    
    enum State {
        case loading
        case loaded(categpries: [Category])
        case error(message: String?)
    }
    
    // MARK: -  Published Properties
    
    @Published var state: State = .loading
    @Published var alert: AlertType?
    
    // MARK: - Properties
    
    private let interactor: CategoriesInteractable
    private weak var router: CategoriesRouter?
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Proxies
    
    
    // MARK: - Initialiser
    
    init(interactor: CategoriesInteractable, router: CategoriesRouter?) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Methods
    
    func onFirstAppear() {
        
    }
    
    // MARK: - Private Methods
    
    
