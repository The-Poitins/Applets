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
                HStack {
                    Text(LocalizedStringKey(step.title ?? ""))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Spacer()
                    ZStack {
                        Circle()
                            .strokeBorder(Color("peach"), lineWidth: 3)
                            .frame(width: 40)
                        if step.isDone {
                            Circle()
                                .frame(width: 30)
                                .foregroundColor(Color("peach"))
                        }
                    }
                    .onTapGesture {
                        viewModel.toggleIsDone(step: step)
                    }
                }
                .padding(.horizontal)
            .frame(width: 370, height: 50)
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.08), radius: 15, y: 2)
        }
        .sheet(isPresented: $isModal) {
            NavigationStack {
                ModalStepView(step: step)
                    .navigationBarTitle(LocalizedStringKey(step.title ?? ""), displayMode: .inline)
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
