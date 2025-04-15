//
//  notes_platziApp.swift
//  notes.platzi
//
//  Created by Julian González on 13/04/25.
//

import SwiftUI

@main
struct notes_platziApp: App {
    @StateObject var appInfo = AppInfo()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appInfo)
        }
    }
}
