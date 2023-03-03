//
//  OnboardingViewModel.swift
//  Applets
//
//  Created by シェイミ on 28/02/2023.
//

import SwiftUI

class OnboardingViewModel {
// For the EU/non-EU Buttons
    func getBackgroundColor(isEUButton: Bool?, title: String) -> Color {
        var backgroundColor = Color.white
        guard let isEUButton else { return backgroundColor }

        if title == "EU" {
            if isEUButton {
                backgroundColor = Color.blue
            }
        }

        if title == "non-EU" {
            if !isEUButton {
                backgroundColor = Color.blue
            }
        }
        return backgroundColor
    }
}
