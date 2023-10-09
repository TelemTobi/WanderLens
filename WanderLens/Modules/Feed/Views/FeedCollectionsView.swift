//
//  FeedCollectionsView.swift
//  WanderLens
//
//  Created by Telem Tobi on 09/10/2023.
//

import SwiftUI

extension FeedView {
    struct CollectionsView: View {
        
        var body: some View {
            Text("Collections")
                .font(.title)
                .fontWeight(.semibold)
            
            Color.white.frame(height: 100)
        }
    }
}

#Preview {
    FeedView.CollectionsView()
}
