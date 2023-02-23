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

    @Published var goals: [Goal] = []

    private let goalsFRC: NSFetchedResultsController<Goal>
    private let managedObjectContext: NSManagedObjectContext

    init(isPreview: Bool) {
        managedObjectContext = isPreview ? PersistenceController.preview.context : PersistenceController.shared.context
        let goalsFR: NSFetchRequest<Goal> = Goal.fetchRequest()
        goalsFR.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        goalsFRC = NSFetchedResultsController(fetchRequest: goalsFR,
                                              managedObjectContext: managedObjectContext,
                                              sectionNameKeyPath: nil,
                                              cacheName: nil)
        super.init()
        // Initial fetch to populate tasks array
        goalsFRC.delegate = self
        try? goalsFRC.performFetch()
        if let newGoals = goalsFRC.fetchedObjects {
            self.goals = newGoals
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
        guard let newGoals = controller.fetchedObjects as? [Goal] else {
            return
        }
        self.goals = newGoals
    }
}
