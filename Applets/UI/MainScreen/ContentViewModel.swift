//
//  ContentViewModel.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import Foundation
import Combine

final class ContentViewModel: ObservableObject {

    @Published private var dataManager: DataManager

    private var anyCancellable: AnyCancellable?

    var goals: [Goal] {
        dataManager.goals
    }

    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager
        self.anyCancellable = dataManager.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}
