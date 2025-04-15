//
//  CreateNoteView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct CreateNoteView: View {
    @State var title: String = ""
    @State var text: String = ""
    @State var cardType: CardType = .small
    @State var isFavorite: Bool = false
    
    var onCreateNote: ((Card) -> Void)?
    
    func saveNote() {
        let card = Card(
            title: title,
            text: text,
            type: cardType,
            isFavorite: isFavorite
        )
        
        onCreateNote?(card)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Crear nota")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)
                
                TextField("Título", text: $title)
                    .font(.headline)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                TextEditor(text: $text)
                    .scrollContentBackground(.hidden)
                    .font(.body)
                    .frame(height: 150)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                HStack {
                    Text("Selecciona el tipo de nota")
                    Spacer()
                    Picker("Tipo de nota", selection: $cardType) {
                        Text("Pequeño").tag(CardType.small)
                        Text("Mediana").tag(CardType.medium)
                    }
                    .accentColor(.red)
                    
                }
                
                Toggle(isOn: $isFavorite) {
                    Text("Marcar como favorito")
                }
                
                Button {
                    saveNote()
                } label : {
                    Text("Guardar nota")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.red)
                        .cornerRadius(10)
                }
                .padding(.top, 50)

            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    CreateNoteView()
}
