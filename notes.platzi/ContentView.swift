//
//  ContentView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAddNote = false
    
    let notes: [Note] = [
        Note(title: "Note 1", text: "Texto note 1", type: .small, isFavorite: false),
        Note(title: "Note 2", text: "Texto note 2", type: .medium, isFavorite: true)
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(notes) { note in
                    NoteView(note: note)
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
            CreateNoteView() { note in
                print(note)
                showAddNote = false
            }
        }
    }
}

#Preview {
    ContentView()
}
