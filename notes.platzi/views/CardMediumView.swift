//
//  CardMediumView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct CardMediumView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "heart")
                    .foregroundColor(.red)
            }
            
            Text("Hello word!")
                .font(.headline)
                .lineLimit(2)
                .frame(width: 120)
                .padding(8)
                .background(.cyan.opacity(0.2))
                .cornerRadius(10)
            
            Text("Este es un ejemplo de un card small")
                .font(.subheadline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(width: .infinity)
        }
        .frame(height: 150)
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    CardMediumView()
}
