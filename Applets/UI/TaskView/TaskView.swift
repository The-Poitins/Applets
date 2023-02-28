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
                    .modifier(FilledCellModifier(percentOfDone: viewModel.goal.fractionOfDone))
                    .foregroundColor(.clear)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.1), radius: 20, y: 2)
                Text("\(viewModel.goal.percentOfDone)% has done")
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)

            if let image = viewModel.goal.image, !image.isEmpty {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .shadow(color: .black.opacity(0.08), radius: 20, y: 2)
            }
            
            Text("Description")
                .font(.title)
                .padding(.top, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Text(LocalizedStringKey(viewModel.goal.information ?? ""))
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
        .background(Color("yellowColor").opacity(0.10))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        let goal = Goal.previewExample(for: 0, in: PersistenceController.preview.context)
        TaskView(goal: goal)
    }
}
