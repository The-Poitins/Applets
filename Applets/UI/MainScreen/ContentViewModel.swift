//
//  ContentViewModel.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import Foundation

final class ContentViewModel: ObservableObject {

    @Published private var dataManager: TasksDataManager

    var tasks: [Task] {
        dataManager.tasks
    }

    init(dataManager: TasksDataManager = TasksDataManager.shared) {
        self.dataManager = dataManager
    }
}
