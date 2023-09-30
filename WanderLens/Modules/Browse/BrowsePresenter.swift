//
//  BrowsePresenter.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import SwiftUI
import Combine

@MainActor
class BrowsePresenter: ObservableObject {
    
    enum State {
        case loading
        case loaded(photos: [Photo])
        case error(message: String?)
    }
    
    // MARK: -  Published Properties
    
    @Published var state: State = .loading
    @Published var alert: AlertType?
    
    // MARK: - Properties
    
    private let interactor: BrowseInteractable
    private weak var router: BrowseRouter?
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Proxies
    
    var locationSuggestions: [String] { interactor.locationSuggestions }
    var styleSuggestions: [String] { interactor.styleSuggestions }
    
    // MARK: - Initialiser
    
    init(interactor: BrowseInteractable, router: BrowseRouter?) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Methods
    
    func onFirstAppear() {
        initSubscriptions()
        fetchPhotos()
    }
    
    // MARK: - Private Methods
    
    private func initSubscriptions() {
        NotificationCenter.default
            .publisher(for: Constants.Notification.photoSaveSucceeded)
            .sink { [weak self] notification in
                self?.alert = .photoSaveSucceeded
            }
            .store(in: &subscriptions)
        
        NotificationCenter.default
            .publisher(for: Constants.Notification.photoSaveFailed)
            .sink { [weak self] notification in
                self?.alert = .photoSaveFailed
            }
            .store(in: &subscriptions)
    }
    
    private func fetchPhotos() {
        interactor.listPhotos(page: 0, orderedBy: .popularity) { [weak self] photos, error in
            guard let self else { return }
            
            guard let photos else {
                state = .error(message: error?.localizedDescription)
                return
            }
            
            state = .loaded(photos: photos)
        }
    }
}

extension BrowsePresenter: PhotoListItemDelegate {
    
    func savePhoto(_ photo: Photo) {
        guard let imageUrl = URL(string: photo.urls?.full ?? "") else {
            alert = .photoSaveFailed
            return
        }
        
        interactor.saveImage(from: imageUrl)
    }
}
