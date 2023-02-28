//
//  QuestionButtonsView.swift
//  Applets
//
//  Created by シェイミ on 23/02/2023.
//

import SwiftUI

struct QuestionButtonView: View {
    var title: String
    @Binding var isEUButton: Bool?

    var body: some View {
            Button {
                if title == "EU" {
                    isEUButton = true
                } else {
                    isEUButton = false
                }
            } label: {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(getBackgroundColor(), in: RoundedRectangle(cornerRadius: 12))
            }
    }

    func getBackgroundColor() -> Color {
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

struct QuestionButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionButtonView(title: "EU", isEUButton: .constant(true))
    }
}
