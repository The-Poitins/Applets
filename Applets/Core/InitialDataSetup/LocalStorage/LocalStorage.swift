//
//  LocalStorage.swift
//  Applets
//
//  Created by Ekaterina Grishina on 23/02/23.
//

import Foundation

final class LocalStorage {

    private let userDefaults = UserDefaults.standard

    func value<T>(for key: LocalStorageKeyProtocol) -> T? {
        userDefaults.object(forKey: key.rawValue) as? T
    }

    func write<T>(value: T, for key: LocalStorageKeyProtocol) {
        userDefaults.set(value, forKey: key.rawValue)
    }

    func removeValue(for key: LocalStorageKeyProtocol) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
