//
//  Note.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import Foundation

struct Note: Identifiable, Equatable {
    let id: UUID = UUID()
    var title: String
    var text: String
    var type: NoteType
    var isFavorite: Bool
}

enum NoteType {
    case small
    case medium
}
