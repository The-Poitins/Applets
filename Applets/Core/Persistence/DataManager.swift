//
//  DataManager.swift
//  Applets
//
//  Created by Ekaterina Grishina on 20/02/23.
//

import Foundation
import CoreData

final class DataManager: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {

    static let shared = DataManager(isPreview: false)
    static let preview = DataManager(isPreview: true)

    @Published var tasks: [Task] = []

    private let tasksFRC: NSFetchedResultsController<Task>
    private let managedObjectContext: NSManagedObjectContext

    init(isPreview: Bool) {
        managedObjectContext = isPreview ? PersistenceController.preview.context : PersistenceController.shared.context
        let tasksFR: NSFetchRequest<Task> = Task.fetchRequest()
        tasksFR.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        tasksFRC = NSFetchedResultsController(fetchRequest: tasksFR,
                                              managedObjectContext: managedObjectContext,
                                              sectionNameKeyPath: nil,
                                              cacheName: nil)
        super.init()
        // Initial fetch to populate tasks array
        tasksFRC.delegate = self
        try? tasksFRC.performFetch()
        if let newTasks = tasksFRC.fetchedObjects {
            self.tasks = newTasks
        }
    }

    func saveData() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                NSLog("Unresolved error saving context: \(error), \(error.userInfo)")
            }
        }
    }

    // MARK: - NSFetchedResultsControllerDelegate

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let newTasks = controller.fetchedObjects as? [Task] else {
            return
        }
        self.tasks = newTasks
    }
}
