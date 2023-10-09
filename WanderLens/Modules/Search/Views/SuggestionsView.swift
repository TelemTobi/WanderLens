//
//  SuggestionsView.swift
//  WanderLens
//
//  Created by Telem Tobi on 09/10/2023.
//

import SwiftUI

extension SearchView {
    struct SuggestionsView: View {
        
        @Binding var didFirstAppear: Bool
        
        let locationSuggestions: [String] = ["New York", "Tokyo", "Tel Aviv", "Paris", "London", "Miami", "Dublin", "Barcelona", "Los Angeles", "Dubai", "Rome"]
        let styleSuggestions: [String] = ["Monochromatic", "Architecture & Interiors", "Nature", "3D Rendres", "Fashion & Beauty", "Animals", "Experimental", "People", "Film", "Traval", "Sports"]
        
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
    SearchView.SuggestionsView(didFirstAppear: .constant(false))
}
