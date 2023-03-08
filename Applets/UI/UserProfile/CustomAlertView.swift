//
//  CustomAlertView.swift
//  Applets
//
//  Created by シェイミ on 07/03/2023.
//

import SwiftUI

struct CustomAlertView: View {
    @Binding var showAlert: Bool
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 25) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Button {
                    withAnimation {
                        showAlert.toggle()
                    }
                } label: {
                    Text("Done")
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(.ultraThinMaterial)
            .cornerRadius(25)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.primary.opacity(0.35)
                .onTapGesture {
                    withAnimation {
                        showAlert.toggle()
                    }
                }
        )
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(showAlert: .constant(true))
    }
}
