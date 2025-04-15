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
    
    
    var body: some View {
        VStack {
            List {
                ForEach(appInfo.notes) { note in
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
                appInfo.createNote(note: note)
                showAddNote = false
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppInfo())
}
