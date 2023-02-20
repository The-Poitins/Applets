//
//  Task+Extension.swift
//  Applets
//
//  Created by Ekaterina Grishina on 20/02/23.
//

import Foundation
import CoreData

extension Task {

    var allSteps: Set<Step> {
        return (steps as? Set<Step>) ?? []
    }

    static func previewExample(for index: Int, in context: NSManagedObjectContext) -> Task {
        let task = Task(context: context)
        task.id = UUID()
        task.title = "Task \(index)"
        task.information = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        """
        task.timeFrame = 3

        let step = Step(context: context)
        step.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        """
        step.number = 1
        step.weight = 2
        step.title = "Step 123"
        step.isDone = false

        step.task = task
        task.addToSteps(step)

        return task
    }
}
