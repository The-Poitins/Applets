//
//  AppletsApp.swift
//  Applets
//
//  Created by Ekaterina Grishina on 16/02/23.
//

import SwiftUI

@main
struct AppletsApp: App {

    private let dataPreloadService = DataPreloadAction()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    dataPreloadService.preloadData { _ in
                        // TODO: show error
                    }
                }
        }
    }
}
