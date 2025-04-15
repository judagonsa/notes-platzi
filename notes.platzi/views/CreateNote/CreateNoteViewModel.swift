//
//  CreateNoteViewModel.swift
//  notes.platzi
//
//  Created by Julian González on 14/04/25.
//

import SwiftUI

class CreateNoteViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var text: String = ""
    @Published var noteType: NoteType = .small
    @Published var isFavorite: Bool = false
    
    func createNote() -> Note {
        let note = Note(
            title: title,
            text: text,
            type: noteType,
            isFavorite: isFavorite
        )
        
        return note
    }
}
