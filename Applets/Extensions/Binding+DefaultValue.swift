//
//  Binding+DefaultValue.swift
//  Applets
//
//  Created by Ekaterina Grishina on 01/03/23.
//

import SwiftUI

extension Binding {
    func withDefault<T>(_ defaultValue: T) -> Binding<T> where Value == T? {
        return Binding<T>(
            get: {
                self.wrappedValue ?? defaultValue
            },
            set: { newValue in
                self.wrappedValue = newValue
            }
        )
    }
}
