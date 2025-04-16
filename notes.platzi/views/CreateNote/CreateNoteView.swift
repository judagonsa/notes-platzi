//
//  CreateNoteView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct CreateNoteView: View {
    @ObservedObject var viewModel: CreateNoteViewModel = CreateNoteViewModel()
    
    @State var note: Note?
    
    var onCreateNote: ((Note) -> Void)?
    
    func saveNote() {
        //validar campos y mostrar error
        let note = viewModel.createNote()
        
        onCreateNote?(note)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Crear nota")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)
                
                TextField("Título", text: $viewModel.title)
                    .font(.headline)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                TextEditor(text: $viewModel.text)
                    .scrollContentBackground(.hidden)
                    .font(.body)
                    .frame(height: 150)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                HStack {
                    Text("Selecciona el tipo de nota")
                    Spacer()
                    Picker("Tipo de nota", selection: $viewModel.noteType) {
                        Text("Pequeño").tag(NoteType.small)
                        Text("Mediana").tag(NoteType.medium)
                    }
                    .accentColor(.red)
                    
                }
                
                Toggle(isOn: $viewModel.isFavorite) {
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
            .onAppear {
                if let noteEdit = note {
                    viewModel.title = noteEdit.title
                    viewModel.text = noteEdit.text
                    viewModel.noteType = noteEdit.type
                    viewModel.isFavorite = noteEdit.isFavorite
                }
            }
        }
    }
}

#Preview {
    CreateNoteView()
}
