//
//  BrowseView.swift
//  WanderLens
//
//  Created by Telem Tobi on 25/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct BrowseView: View {
    
    @ObservedObject private var presenter: BrowsePresenter
    
    @State private var isMapShowing: Bool = false
    @State private var searchQuery: String = ""
    
    @State private var numberOfColumns: Int = 2
    
    private var gridItems: [GridItem] = [
        .init(.flexible())
    ]
    
    init(presenter: BrowsePresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            switch presenter.state {
            case .loading:
                ProgressView()
                
            case .loaded(let photos):
                ScrollView(showsIndicators: false) {
                    DynamicVGrid(columns: numberOfColumns) {
                        ForEach(photos) { photo in
                            WebImage(url: URL(string: photo.urls?.regular ?? ""))
                                .resizable()
                                .placeholder {
                                    Image(uiImage: .init(blurHash: photo.blurHash ?? "", size: .init(width: 4, height: 3))!
                                    )
                                    .resizable()
                                }
                                .transition(.fade(duration: 0.2))
                                .aspectRatio(photo.ratio, contentMode: .fit)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Browse")
                .toolbar(content: toolbarContent)
                .searchable(
                    text: $searchQuery,
                    placement: .navigationBarDrawer,
                    prompt: "What are you looking for..?"
                )
                .onTapGesture {
                    withAnimation {
                        numberOfColumns = (numberOfColumns == 1) ? 2 : 1
                    }
                }
                
            case .error(let message):
                Text(message ?? "An error occured")
            }
        }
        .onFirstAppear(perform: presenter.onFirstAppear)
    }
    
    @ToolbarContentBuilder
    private func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                isMapShowing.toggle()
            } label: {
                Image(systemName: isMapShowing ? "square.grid.2x2" : "map")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    
    static var previews: some View {
        let interactor = BrowseInteractor(interactable: AppController.Preview.interactor)
        let presenter = BrowsePresenter(interactor: interactor, router: nil)
        
        BrowseView(presenter: presenter)
    }
}
