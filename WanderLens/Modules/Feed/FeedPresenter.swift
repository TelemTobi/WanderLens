//
//  FeedPresenter.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import SwiftUI
import Combine

@MainActor
class FeedPresenter: ObservableObject {
    
    enum State {
        case loading
        case loaded(collections: [PhotoCollection], photos: [Photo]) // TODO: Create a FeedResult struct
        case error(message: String?)
    }
    
    // MARK: -  Published Properties
    
    @Published var state: State = .loading
    @Published var alert: AlertType?
    
    // MARK: - Properties
    
    private let interactor: FeedInteractable
    private weak var router: FeedRouter?
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Proxies
    
    
    // MARK: - Initialiser
    
    init(interactor: FeedInteractable, router: FeedRouter?) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Methods
    
    func onFirstAppear() {
        initSubscriptions()
        fetchFeedData()
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
    
    private func fetchFeedData() {
        Task.init { [weak self] in
            guard let self else { return }
            
            async let collectionsResult = interactor.listCollections(page: 0, orderedBy: .popularity)
            async let photosResult = interactor.listPhotos(page: 0, orderedBy: .popularity)
            
            guard let collections = await collectionsResult.collections,
                  let photos = await photosResult.photos else {
                state = .error(message: "An error occured 🥴")
                return
            }
            
            state = .loaded(collections: collections, photos: photos)
        }
    }
}

// MARK: - PhotoListItemDelegate

extension FeedPresenter: PhotoListItemDelegate {
    
    func savePhoto(_ photo: Photo) {
        guard let imageUrl = URL(string: photo.urls?.full ?? "") else {
            alert = .photoSaveFailed
            return
        }
        
        interactor.saveImage(from: imageUrl)
    }
}
