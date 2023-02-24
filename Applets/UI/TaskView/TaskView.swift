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
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 370, height: 25)
                    .foregroundColor(.gray.opacity(0.30))
                    .cornerRadius(20)
                Rectangle()
                    .frame(width: 70, height: 25)
                    .foregroundColor(.accentColor)
                    .cornerRadius(20)
                Text("\(viewModel.goal.percentOfDone)% has done")
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
            Image(viewModel.goal.image ?? "")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .padding(.horizontal)
            Text("Description")
                .font(.title)
                .padding(.top, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Text(viewModel.goal.information ?? "")
                .padding(.horizontal)
            Text("Steps")
                .font(.title)
                .padding(.top, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            ForEach(viewModel.sortedSteps, id: \.self) { step in
                StepView(viewModel: viewModel, step: step)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        let goal = Goal.previewExample(for: 0, in: PersistenceController.preview.context)
        TaskView(goal: goal)
    }
}
