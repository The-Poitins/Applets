//
//  AppletsApp.swift
//  Applets
//
//  Created by Ekaterina Grishina on 16/02/23.
//

import SwiftUI

@main
struct AppletsApp: App {
    @ObservedObject var contentVM = ContentViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(contentVM: contentVM)
        }
    }
}
