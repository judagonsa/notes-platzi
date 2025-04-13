//
//  CardSmallView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct CardSmallView: View {
    
    var card: Card
    
    var body: some View {
        HStack {
            Text(card.title)
                .font(.headline)
                .lineLimit(2)
                .frame(width: 120)
                .padding(8)
                .background(.cyan.opacity(0.2))
                .cornerRadius(10)
            
            Text(card.text)
                .font(.subheadline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
            
            Image(systemName: "heart")
                .foregroundColor(.red)
        }
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
        .listRowSeparator(.hidden)
    }
}

#Preview {
    CardSmallView(card: Card(title: "Card 1", text: "Texto de card 1"))
}
