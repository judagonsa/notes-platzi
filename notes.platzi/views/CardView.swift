//
//  CardSmallView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    
    @ViewBuilder
    var CardSmallView : some View {
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
            
            Image(systemName: card.isFavorite ? "heart.fill" : "heart")
                .foregroundColor(.red)
        }
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
    }
    
    @ViewBuilder
    var CardMediumView : some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: card.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            }
            
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
        }
        .frame(height: 150)
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
    }
    
    var body: some View {
        VStack {
            switch card.type {
                case .small:
                    CardSmallView
                case .medium:
                    CardMediumView
            }
        }
        .listRowSeparator(.hidden)
        
    }
}

#Preview {
    CardView(card: Card(
                    title: "Card 1",
                    text: "Texto de card 1",
                    type: .small,
                    isFavorite: true
                ))
}
