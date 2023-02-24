//
//  BoardingScreen.swift
//  Applets
//
//  Created by シェイミ on 17/02/2023.
//


import SwiftUI

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}
extension BoardingScreen {
    static var longText = """
Getting things done in Napoli can be confusing, especially if you can't speak Italian.

Let us know if you are an EU citizen or not, since the rules are different depending on where you are from.
"""

    static var boardingScreens: [BoardingScreen] = [
        BoardingScreen(image: "profiles_undraw",
                       title: "Welcome to\nthe Academy",
                       description: "We're excited to have you join us on this amazing journey\n\nThis app will try to make your move to\nNapoli a little bit easier."),
        BoardingScreen(image: "sync_undraw",
                       title: "Navigate\nBureaucracy",
                       description: longText),
        BoardingScreen(image: "travel_undraw",
                       title: "Tips and Tricks",
                       description: "We have some extra information about life in Napoli.\n\nTips about transport, mobile phone plans, accommodation and more!"),
        BoardingScreen(image: "fun_undraw",
                       title: "Enjoy yourself!",
                       description: "Once the boring stuff is all sorted you can focus on making friends and creating great apps.")
    ]
}
