//
//  DataManager.swift
//  Applets
//
//  Created by Ekaterina Grishina on 17/02/23.
//

import CoreData

struct DataManager {
    static let shared = DataManager()

    static var preview: DataManager = {
        let result = DataManager(inMemory: true)
        let viewContext = result.container.viewContext
        for index in 0..<10 {
            let task = Task(context: viewContext)
            task.id = UUID()
            task.title = "Task \(index)"
            task.information = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
            """
            task.timeFrame = 3

            let step = Step(context: viewContext)
            step.text = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
            """
            step.number = 1
            step.weight = 2
            step.isDone = false

            step.task = task
            task.addToSteps(step)
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Applets")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    func saveContext(completionHandler: @escaping (Error?) -> Void) {
        if DataManager.shared.container.viewContext.hasChanges {
            do {
                try DataManager.shared.container.viewContext.save()
                completionHandler(nil)
            } catch {
                completionHandler(error)
            }
        }
    }
}
