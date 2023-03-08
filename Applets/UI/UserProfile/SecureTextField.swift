//
//  SecureTextField.swift
//  Applets
//
//  Created by Ekaterina Grishina on 07/03/23.
//

import SwiftUI

struct SecureTextField: View {

    var placeholder: String
    @Binding var data: String?
    @Binding var isEditing: Bool

    @State private var isDataRevealed = false

    var body: some View {
        ZStack {
            Button {
                revealData()
            } label: {
                Rectangle()
            }
            .disabled(isEditing)
            .foregroundColor(.clear)

            HStack {
                if isEditing {
                    TextField(placeholder, text: $data.withDefault(""))
                } else {
                    Text(isDataRevealed ? data ?? "" : data ?? placeholder)
                }
                Spacer()
            }
            .redacted(reason: isEditing || isDataRevealed ? .privacy : .placeholder)
        }
        .onChange(of: isEditing) { newValue in
            isDataRevealed = newValue
        }
    }

    private func revealData() {
        guard !isEditing else { return }

        isDataRevealed.toggle()
    }
}

struct SecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextField(placeholder: "Name", data: .constant("123456788"), isEditing: .constant(false))
    }
}
