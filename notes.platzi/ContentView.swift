//
//  ContentView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAddNote = false
    
    let cards: [Card] = [
        Card(title: "Card 1", text: "Texto card 1", type: .small, isFavorite: false),
        Card(title: "Card 2", text: "Texto card 2", type: .medium, isFavorite: true)
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(cards) { card in
                    CardView(card: card)
                }
            }
            .listStyle(.plain)
            .overlay {
                VStack {
                    Spacer()
                    Button {
                        showAddNote = true
                    } label: {
                        Text("Crear nota")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.red)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .sheet(isPresented: $showAddNote) {
            CreateNoteView() { card in
                print(card)
                showAddNote = false
            }
        }
    }
}

#Preview {
    ContentView()
}
