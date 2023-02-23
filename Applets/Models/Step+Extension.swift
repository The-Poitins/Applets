//
//  Step+Extension.swift
//  Applets
//
//  Created by Ekaterina Grishina on 21/02/23.
//

import Foundation
import CoreData

extension Step {
    static func previewExample(in context: NSManagedObjectContext) -> Step {
        let goal = Goal(context: context)
        goal.id = UUID()
        goal.title = "Task \(index)"
        goal.information = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        """
        goal.timeFrame = "Approx. time 2-4 weeks"

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

        step.task = goal
        goal.addToSteps(step)

        return step
    }
}
