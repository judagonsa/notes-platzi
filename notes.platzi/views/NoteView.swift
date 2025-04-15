//
//  NoteSmallView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct NoteView: View {
    
    var note: Note
    var onTagFavorite: (() -> Void)?
    
    @ViewBuilder
    var NoteSmallView : some View {
        HStack {
            Text(note.title)
                .font(.headline)
                .lineLimit(2)
                .frame(width: 120)
                .padding(8)
                .background(.cyan.opacity(0.2))
                .cornerRadius(10)
            
            Text(note.text)
                .font(.subheadline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
            
            Image(systemName: note.isFavorite ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .onTapGesture {
                    onTagFavorite?()
                }
        }
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
    }
    
    @ViewBuilder
    var NoteMediumView : some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: note.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .onTapGesture {
                        onTagFavorite?()
                    }
            }
            
            Text(note.title)
                .font(.headline)
                .lineLimit(2)
                .frame(width: 120)
                .padding(8)
                .background(.cyan.opacity(0.2))
                .cornerRadius(10)
            
            Text(note.text)
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
            switch note.type {
                case .small:
                    NoteSmallView
                case .medium:
                    NoteMediumView
            }
        }
        .listRowSeparator(.hidden)
        
    }
}

#Preview {
    NoteView(note: Note(
                    title: "Note 1",
                    text: "Texto de note 1",
                    type: .small,
                    isFavorite: true
                ))
}
