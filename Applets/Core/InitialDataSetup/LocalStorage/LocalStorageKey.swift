//
//  LocalStorageKey.swift
//  Applets
//
//  Created by Ekaterina Grishina on 23/02/23.
//

import Foundation

protocol LocalStorageKeyProtocol {
    var rawValue: String { get }
}

enum LocalStorageKey: String, LocalStorageKeyProtocol {
    case hasPreloadedData
}
