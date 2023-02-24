//
//  TaskViewModel.swift
//  Applets
//
//  Created by Ekaterina Grishina on 24/02/23.
//

import Foundation

final class TaskViewModel: ObservableObject {

    @Published var goal: Goal

    private let dataManager = DataManager.shared

    var sortedSteps: [Step] {
        return self.goal.allSteps.sorted(by: { $0.number < $1.number })
    }

    init(goal: Goal) {
        self.goal = goal
    }

    func toggleIsDone(step: Step) {
        step.isDone.toggle()
        /* Workaround to update parent entity:
        Call setter of parent entity updates this entity in the context
         and therefore updates parent entity on the main screen
         */
        goal.addToSteps(step)
        dataManager.saveData()
    }
}
