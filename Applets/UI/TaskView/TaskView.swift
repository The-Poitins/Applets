//
//  TaskView.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import SwiftUI

struct TaskView: View {

    @ObservedObject var viewModel: TaskViewModel

    init(goal: Goal) {
        self.viewModel = TaskViewModel(goal: goal)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ProgressBarView(fractionOfDone: viewModel.goal.fractionOfDone)
                    .animation(.default, value: viewModel.goal.fractionOfDone)

                    if let image = viewModel.goal.image, !image.isEmpty {
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.08), radius: 20, y: 2)
                    }

                    Text("Description")
                        .font(.title)
                        .padding(.vertical, 2)
                    Text(LocalizedStringKey(viewModel.goal.information ?? ""))
            }
            .padding(.horizontal)

            if !viewModel.goal.allSteps.isEmpty {
                VStack(alignment: .leading) {
                    Text("Steps")
                        .font(.title)
                        .padding(.top, 2)
                    ForEach(viewModel.sortedSteps, id: \.self) { step in
                        StepView(viewModel: viewModel, step: step)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color("yellowColor").opacity(0.10))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        let goal = Goal.previewExample(for: 0, in: PersistenceController.preview.context)
        TaskView(goal: goal)
    }
}
