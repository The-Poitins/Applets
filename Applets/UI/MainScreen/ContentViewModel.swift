//
//  ContentViewModel.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import Foundation

final class ContentViewModel: ObservableObject {

    @Published private var dataManager: DataManager

    var tasks: [Task] {
        dataManager.tasks
    }

    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager
    }
}
