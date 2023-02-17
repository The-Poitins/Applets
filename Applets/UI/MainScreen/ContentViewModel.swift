//
//  ContentViewModel.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    let tasks: [String] = ["Some Task", "Another Task", "One more Task"]
}
