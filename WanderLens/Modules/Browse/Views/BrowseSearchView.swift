//
//  BrowseSearchView.swift
//  WanderLens
//
//  Created by Telem Tobi on 29/09/2023.
//

import SwiftUI

extension BrowseView {
    
    struct SearchView: View {
        
        @Binding var didFirstAppear: Bool
        
        let locationSuggestions: [String]
        let styleSuggestions: [String]
        
        init(didFirstAppear: Binding<Bool>, locationSuggestions: [String], styleSuggestions: [String]) {
            self._didFirstAppear = didFirstAppear
            self.locationSuggestions = locationSuggestions
            self.styleSuggestions = styleSuggestions
        }
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Locations")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    suggestionsView(locationSuggestions)
                    
                    Text("Styles")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    suggestionsView(styleSuggestions)
                }
                .padding()
            }
            .onFirstAppear {
                didFirstAppear = true
            }
        }
        
        private func suggestionsView(_ suggestions: [String]) -> some View {
            let delays = Array(0..<suggestions.count).map { CGFloat($0) * 0.05 }.shuffled()
            
            return TagCloudsView(tags: suggestions) { index, suggestion in
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text(suggestion)
                        .font(.footnote)
                        .fontWeight(.medium)
                }
                .buttonStyle(TagButtonStyle())
                .opacity(didFirstAppear ? 1 : 0)
                .scaleEffect(didFirstAppear ? 1 : 0.7)
                .rotationEffect(.degrees(didFirstAppear ? 0 : 10))
                .animation(
                    .easeInOut(duration: 0.25).delay(delays[index]),
                    value: didFirstAppear
                )
            }
        }
    }
}

#Preview {
    BrowseView.SearchView(didFirstAppear: .constant(false), locationSuggestions: [], styleSuggestions: [])
}
