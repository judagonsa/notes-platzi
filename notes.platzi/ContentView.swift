//
//  ContentView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    
    let cards: [Card] = [
        Card(title: "Card 1", text: "Texto card 1", type: .small),
        Card(title: "Card 2", text: "Texto card 2", type: .medium)
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(cards) { card in
                    CardView(card: card)
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}
