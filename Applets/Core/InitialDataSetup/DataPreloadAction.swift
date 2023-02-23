//
//  DataPreloadAction.swift
//  Applets
//
//  Created by Ekaterina Grishina on 23/02/23.
//

import Foundation

final class DataPreloadAction {

    private let localStorage = LocalStorage()
    private let dataPopulateService = DataPopulateService()

    func preloadData(completion: @escaping (Error?) -> Void) {
        let hasPreloadedData: Bool = localStorage.value(for: LocalStorageKey.hasPreloadedData) ?? false

        guard !hasPreloadedData else { return }

        dataPopulateService.preloadData { [weak self] error in
            guard let error = error else {
                completion(nil)
                self?.localStorage.write(value: true, for: LocalStorageKey.hasPreloadedData)
                return
            }

            completion(error)
        }
    }
}
