//
//  ContentView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    
    let cards: [Card] = [
        Card(title: "Card 1", text: "Small", type: .small),
        Card(title: "Card 2", text: "Medium", type: .medium)
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(cards) { card in
                    switch card.type {
                        case .small:
                            CardSmallView(card: card)
                        case .medium:
                            CardMediumView(card: card)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}
