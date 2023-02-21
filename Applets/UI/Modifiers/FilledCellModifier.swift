//
//  FilledCellModifier.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 20/02/23.
//

import SwiftUI

struct FilledCell: ViewModifier {
    var percentOfDone: Double
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    ZStack {
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.40))
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            Rectangle()
                                .fill(Color.accentColor)
                                .frame(width: CGFloat(percentOfDone) * geometry.size.width, height:  geometry.size.height)
                        }
                    }
                }
            )
    }
}
