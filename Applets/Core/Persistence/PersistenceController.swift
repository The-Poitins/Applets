//
//  PersistenceController.swift
//  Applets
//
//  Created by Ekaterina Grishina on 17/02/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for index in 0..<10 {
            let task = Goal.previewExample(for: index, in: viewContext)
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

    var context: NSManagedObjectContext { container.viewContext }

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
            if context.hasChanges {
                do {
                    try PersistenceController.shared.container.viewContext.save()
                    completionHandler(nil)
                } catch {
                    completionHandler(error)
                }
            }
        }
}
