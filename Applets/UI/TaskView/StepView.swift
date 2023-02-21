//
//  StepView.swift
//  Applets
//
//  Created by Viacheslav on 20/02/23.
//

import SwiftUI

struct StepView: View {

    @State var step: Step

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray.opacity(0.1))
                .frame(width: 370, height: 50)
                .cornerRadius(10)
            HStack {
                Text(step.title ?? "")
                    .font(.headline)
                Spacer()
                ZStack {
                    Circle()
                        .strokeBorder(Color.accentColor, lineWidth: 3)
                        .frame(width: 40)
                    if step.isDone {
                        Circle()
                            .frame(width: 30)
                            .foregroundColor(.accentColor)
                    }
                }
                .onTapGesture {
                    step.isDone.toggle()
                }
            }
            .padding(.horizontal)
        }.padding(.horizontal)
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        let step = Step.previewExample(in: PersistenceController.preview.context)
        StepView(step: step)
    }
}
