//
//  FeedEmptyState.swift
//  WanderLens
//
//  Created by Telem Tobi on 16/10/2023.
//

import SwiftUI

extension FeedView {
    
    struct EmptyState: View {
        
        let message: String?
        
        @EnvironmentObject private var presenter: FeedPresenter
        
        var body: some View {
            ContentUnavailableView {
                Label("Something went wrong", systemImage: "exclamationmark.triangle")
            } description: {
                Text(message ?? "An error occured")
            } actions: {
                Button("Retry") {
                    presenter.retry()
                }
            }
        }
    }
}

#Preview {
    FeedView.EmptyState(message: nil)
}
