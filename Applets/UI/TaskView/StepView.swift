//
//  StepView.swift
//  Applets
//
//  Created by Viacheslav on 20/02/23.
//

import SwiftUI

struct StepView: View {

    @ObservedObject var viewModel: TaskViewModel
    @ObservedObject var step: Step

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
                        viewModel.toggleIsDone(step: step)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $isModal) {
            NavigationStack {
                ModalStepView(step: step)
                    .navigationBarTitle(step.title ?? "", displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Close") { isModal.toggle()
                            }
                        }
                        if !step.isDone {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Done") {
                                    isModal.toggle()
                                    viewModel.toggleIsDone(step: step)
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
        let goal = Goal.previewExample(for: 1, in: PersistenceController.preview.context)
        let step = Step.previewExample(in: PersistenceController.preview.context)
        let viewModel = TaskViewModel(goal: goal)
        StepView(viewModel: viewModel, step: step)
    }
}
