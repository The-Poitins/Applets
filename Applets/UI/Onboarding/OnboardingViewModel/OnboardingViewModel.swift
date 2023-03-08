//
//  OnboardingViewModel.swift
//  Applets
//
//  Created by シェイミ on 28/02/2023.
//

import SwiftUI

class OnboardingViewModel {
// For the EU/non-EU Buttons
    func getBackgroundColor(isEUButton: Bool?, title: LocalizedStringKey) -> Color {
        var backgroundColor = Color.white
        guard let isEUButton else { return backgroundColor }

        if title == "EU" {
            if isEUButton {
                backgroundColor = Color.black.opacity(0.8)
            }
        }

        if title == "non-EU" {
            if !isEUButton {
                backgroundColor = Color.black.opacity(0.8)
            }
        }
        return backgroundColor
    }
    
    func getForegroundColor(isEUButton: Bool?, title: LocalizedStringKey) -> Color {
        var foregroundColor = Color.black
        guard let isEUButton else { return foregroundColor }

        if title == "EU" {
            if isEUButton {
                foregroundColor = Color.white
            }
        }

        if title == "non-EU" {
            if !isEUButton {
                foregroundColor = Color.white
            }
        }
        return foregroundColor
    }
}
