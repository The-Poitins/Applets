//
//  AppletsApp.swift
//  Applets
//
//  Created by Ekaterina Grishina on 16/02/23.
//

import SwiftUI

@main
struct AppletsApp: App {
    @StateObject var tasksDataModel = TasksDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tasksDataModel)
        }
    }
}
