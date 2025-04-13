//
//  Card.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import Foundation

struct Card: Identifiable {
    let id: UUID = UUID()
    let title: String
    let text: String
    let type: CardType
}

enum CardType {
    case small
    case medium
}
