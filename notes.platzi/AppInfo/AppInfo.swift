//
//  AppInfo.swift
//  notes.platzi
//
//  Created by Julian González on 14/04/25.
//

import Foundation

class AppInfo: ObservableObject {
    @Published var notes: [Note] = [
        Note(title: "Compra semanal", text: "Leche, huevos, pan y fruta.", type: .medium, isFavorite: true),
        Note(title: "Reunión de proyecto", text: "Reunión semanal el lunes a las 10 AM.", type: .small, isFavorite: false),
        Note(title: "Recordatorio de cumpleaños", text: "No olvidar el cumpleaños de Juan el 20 de abril.", type: .medium, isFavorite: true),
        Note(title: "Ideas para vacaciones", text: "Playa, montaña, y turismo cultural.", type: .small, isFavorite: false),
        Note(title: "Objetivos de lectura", text: "Leer 12 libros este año.", type: .medium, isFavorite: true),
        Note(title: "Asuntos pendientes", text: "Enviar el informe y actualizar el sitio web.", type: .small, isFavorite: false),
        Note(title: "Recipe for Pancakes", text: "Huevos, leche, harina y mantequilla.", type: .medium, isFavorite: true),
        Note(title: "Lista de películas", text: "Inception, The Matrix, Interstellar.", type: .small, isFavorite: false),
        Note(title: "Plan de entrenamiento", text: "Ejercicio 5 veces a la semana.", type: .medium, isFavorite: true),
        Note(title: "Reflexiones del día", text: "Hoy fue un día productivo y gratificante.", type: .small, isFavorite: false)
    ]
    
    func createNote(note: Note) {
        notes.append(note)
    }
    
    func addFavorite(note: Note) {
        if let index = notes.firstIndex(of: note) {
            notes[index].isFavorite.toggle()
        }
    }
    
    func updateNote(oldNote: Note, newNote: Note) {
        if let index = notes.firstIndex(of: oldNote) {
            notes[index] = newNote
        }
    }
}
