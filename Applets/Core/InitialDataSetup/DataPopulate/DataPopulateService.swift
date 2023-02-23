//
//  DataPopulateService.swift
//  Applets
//
//  Created by Ekaterina Grishina on 23/02/23.
//

import Foundation

final class DataPopulateService {

    private let parser = TasksDataParser()
    private let persistence = PersistenceController.shared

    func preloadData(completion: @escaping (Error?) -> Void) {
        parser.allTasks.forEach { task in
            let goal = Goal(context: persistence.context)
            goal.id = UUID()
            goal.title = task.title
            goal.timeFrame = task.timeFrame
            goal.image = task.imageName
            goal.information = task.information
            goal.isEnabled = task.isEnabled

            task.steps.forEach { stepData in
                let step = Step(context: persistence.context)
                step.id = UUID()
                step.title = stepData.title
                step.weight = stepData.weight
                step.isDone = stepData.isDone
                step.number = Int64(stepData.number)
                step.text = stepData.text
                step.task = goal
                goal.addToSteps(step)
            }
        }

        persistence.saveContext(completionHandler: completion)
    }
}
