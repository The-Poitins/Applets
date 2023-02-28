//
//  TasksDataParser.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 21/02/23.
//

import Foundation

final class TasksDataParser {
    var allTasks: [TasksData] = []

    init() {
        loadTasks()
    }

    func loadTasks() {

        guard let url = Bundle.main.url(forResource: "InitialData", withExtension: "json") else {
            fatalError("URL doesn't exist")
        }

        guard let taskData = try? Data(contentsOf: url) else {
            fatalError("Data doesn't exist")
        }

        guard let localTasks = try? JSONDecoder().decode([TasksData].self, from: taskData) else {
            fatalError("Can't decode cells from local resource")
        }

        allTasks = localTasks
    }
}
