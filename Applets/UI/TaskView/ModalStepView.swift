//
//  ModalStepView.swift
//  Applets
//
//  Created by Viacheslav on 20/02/23.
//

import SwiftUI

struct ModalStepView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nisi rhoncus, facilisis velit in, pellentesque massa.")
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nisi rhoncus, facilisis velit in, pellentesque massa.")
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nisi rhoncus, facilisis velit in, pellentesque massa.")
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct ModalStepView_Previews: PreviewProvider {
    static var previews: some View {
        ModalStepView()
    }
}
