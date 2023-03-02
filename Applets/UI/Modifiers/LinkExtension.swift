//
//  LinkExtension.swift
//  Applets
//
//  Created by Viacheslav on 02/03/23.
//

import Foundation
import SwiftUI

extension Text {
    func hyperlink(destination: String, color: Color = .blue) -> some View {
        let text = self
        let range = (String(describing: text) as NSString).range(of: String(describing: text))
        return text
            .foregroundColor(color)
            .underline()
            .onTapGesture {
                guard let url = URL(string: destination) else { return }
                UIApplication.shared.open(url)
            }
            .overlay(
                Rectangle()
                    .fill(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.ultraThinMaterial)
                    .opacity(0.001)
            )
    }
}
