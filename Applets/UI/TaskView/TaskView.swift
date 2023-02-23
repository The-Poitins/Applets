//
//  TaskView.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import SwiftUI

struct TaskView: View {

    @State var goal: Goal

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
                Text("15% has done")
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
            Image(goal.image ?? "")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .padding(.horizontal)
            Text("Description")
                .font(.title)
                .padding(.top, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Text("There is some text about the TASK. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean maximus nisi quis sem pharetra, sit amet vulputate nisi efficitur.")
                .padding(.horizontal)
            Text("Steps")
                .font(.title)
                .padding(.top, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            ForEach(goal.allSteps, id: \.self) { step in
                StepView(step: step)
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
