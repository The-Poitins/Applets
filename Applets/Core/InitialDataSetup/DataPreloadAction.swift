//
//  DataPreloadAction.swift
//  Applets
//
//  Created by Ekaterina Grishina on 23/02/23.
//

import Foundation

final class DataPreloadAction {

    private let dataPopulateService = DataPopulateService()

    func preloadData(completion: @escaping (Error?) -> Void) {
        let hasPreloadedData: Bool = LocalStorage.value(for: LocalStorageKey.hasPreloadedData) ?? false

        guard !hasPreloadedData else { return }

        dataPopulateService.preloadData { error in
            guard let error else {
                completion(nil)
                LocalStorage.write(value: true, for: LocalStorageKey.hasPreloadedData)
                return
            }

            completion(error)
        }
    }
}
