//
//  QuestionButtonView.swift
//  Applets
//
//  Created by シェイミ on 23/02/2023.
//

import SwiftUI

struct QuestionButtonView: View {
    var title: String
    @Binding var isPressed: Bool
    @Binding var isOtherButtonPressed: Bool

    var body: some View {
            Button {
                if isPressed == false && isOtherButtonPressed == false {
                    isPressed.toggle()
                } else {
                    isPressed.toggle()
                    isOtherButtonPressed.toggle()
                }

            } label: {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(isPressed ? Color.blue : Color.white, in: RoundedRectangle(cornerRadius: 12))
            }
    }
}

struct QuestionButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionButtonView(title: "EU", isPressed: .constant(true), isOtherButtonPressed: .constant(false))
    }
}
