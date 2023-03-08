//
//  LocalStorage.swift
//  Applets
//
//  Created by Ekaterina Grishina on 23/02/23.
//

import Foundation

final class LocalStorage {

    static func value<T>(for key: LocalStorageKeyProtocol) -> T? {
        UserDefaults.standard.object(forKey: key.rawValue) as? T
    }

    static func write<T>(value: T, for key: LocalStorageKeyProtocol) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }

    static func removeValue(for key: LocalStorageKeyProtocol) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}
