//
//  Task+Extension.swift
//  Applets
//
//  Created by Ekaterina Grishina on 20/02/23.
//

import Foundation
import CoreData

extension Goal {

    var allSteps: [Step] {
        return Array(steps as? Set<Step> ?? [])
    }

    static func previewExample(for index: Int, in context: NSManagedObjectContext) -> Goal {
        let goal = Goal(context: context)
        goal.id = UUID()
        goal.title = "Task \(index)"
        goal.information = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        """
        goal.timeFrame = "Approx. time 2-4 weeks"
        goal.image = "cf"

        let step = Step(context: context)
        step.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        """
        step.number = 1
        step.weight = 0.4
        step.title = "Step 123"
        step.isDone = false

        step.task = goal
        goal.addToSteps(step)

        return goal
    }
}

extension Goal {
    var percentOfDone: Int {
        return Int(fractionOfDone * 100)
    }

    var fractionOfDone: Double {
        return allSteps.reduce(0) { result, step in
            guard step.isDone else { return result }
            return result + step.weight
        }
    }
}
