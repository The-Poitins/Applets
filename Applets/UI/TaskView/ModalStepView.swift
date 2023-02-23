//
//  ModalStepView.swift
//  Applets
//
//  Created by Viacheslav on 20/02/23.
//

import SwiftUI

struct ModalStepView: View {

    @State var step: Step

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(LocalizedStringKey(step.text ?? ""))
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct ModalStepView_Previews: PreviewProvider {
    static var previews: some View {
        let step = Step.previewExample(in: PersistenceController.preview.context)
        ModalStepView(step: step)
    }
}
