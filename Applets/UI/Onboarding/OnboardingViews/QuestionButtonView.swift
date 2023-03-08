//
//  QuestionButtonsView.swift
//  Applets
//
//  Created by シェイミ on 23/02/2023.
//

import SwiftUI

struct QuestionButtonView: View {
    var onboardingVM = OnboardingViewModel()
    var title: LocalizedStringKey
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
                    .foregroundColor(onboardingVM.getForegroundColor(isEUButton: isEUButton, title: title))
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(onboardingVM.getBackgroundColor(isEUButton: isEUButton, title: title), in: RoundedRectangle(cornerRadius: 12))
            }
    }
}

struct QuestionButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionButtonView(title: "EU", isEUButton: .constant(true))
    }
}
