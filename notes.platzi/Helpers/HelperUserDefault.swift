//
//  HelperUserDefault.swift
//  notes.platzi
//
//  Created by Julian González on 15/04/25.
//
import Foundation

class HelperUserDefault {
    static let userDefaults = UserDefaults.standard
    
    static func saveNotes(notes: [Note]) -> Bool {
        if let data = try? JSONEncoder().encode(notes){
            UserDefaults.standard.set(data, forKey: "notes")
            return true
        }
        
        return false
    }
    
    static func getNotes() -> [Note]? {
        guard let data = UserDefaults.standard.data(forKey: "notes") else {
            return nil
        }
        
        return try? JSONDecoder().decode([Note].self, from: data)
    }
}
