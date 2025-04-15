//
//  Note.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import Foundation

struct Note: Identifiable {
    let id: UUID = UUID()
    let title: String
    let text: String
    let type: NoteType
    let isFavorite: Bool
}

enum NoteType {
    case small
    case medium
}
