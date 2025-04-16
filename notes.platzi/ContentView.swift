//
//  ContentView.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appInfo: AppInfo
    
    @State var showAddNote = false
    @State var selectedNote: Note?
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List (appInfo.notes) { note in
                    NoteView(note: note) {
                        appInfo.addFavorite(note: note)
                    }
                    .onTapGesture {
                        selectedNote = note
                        showAddNote = true
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
                CreateNoteView(note: selectedNote ?? nil) { note in
                    if selectedNote != nil {
                        appInfo.updateNote(oldNote: selectedNote!, newNote: note)
                        selectedNote = nil
                    } else {
                        appInfo.createNote(note: note)
                    }
                    
                    showAddNote = false
                }
            }
            .navigationTitle("Notas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button{
                    if appInfo.saveNotes() {
                        showAlert = true
                    }
                } label: {
                    Image(systemName: "bookmark.fill")
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Guardado"),
                    message: Text("Tus notas fueron guardadas con exito.")
                )
            }
        }
        .onAppear {
            if let notesSave = appInfo.getNotes() {
                appInfo.notes = notesSave
            }
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(AppInfo())
}
