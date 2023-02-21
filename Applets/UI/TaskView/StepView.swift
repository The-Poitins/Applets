//
//  StepView.swift
//  Applets
//
//  Created by Viacheslav on 20/02/23.
//

import SwiftUI

struct Step: Identifiable, Hashable {
    let id = UUID()
    var isDone: Bool
    let stepTitle: String
    init(stepTitle: String, isDone: Bool) {
        self.stepTitle = stepTitle
        self.isDone = isDone
    }
}

struct StepView: View {
    @State var step: Step
    @State var isModal = false
    var body: some View {
        Button {
            isModal.toggle()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.1))
                    .frame(width: 370, height: 50)
                    .cornerRadius(10)
                HStack {
                    Text(step.stepTitle)
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
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $isModal) {
            NavigationStack {
                ModalStepView()
                    .navigationBarTitle(step.stepTitle, displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Close") { isModal.toggle()
                            }
                        }
                        if !step.isDone {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Done") {
                                    isModal.toggle()
                                    step.isDone.toggle()
                                }
                            }
                        }
                    }
            }
        }
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(step: Step(stepTitle: "Step title", isDone: true))
    }
}
