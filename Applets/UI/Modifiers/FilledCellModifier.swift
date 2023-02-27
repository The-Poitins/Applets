//
//  FilledCellModifier.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 20/02/23.
//

import SwiftUI

struct FilledCellModifier: ViewModifier {
    var percentOfDone: Double

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
//                    ZStack {
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color("peach"))
                                .frame(width: CGFloat(percentOfDone) * geometry.size.width, height: geometry.size.height)
                            Rectangle()
                                .fill(Color("peach").opacity(0.3))
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }
//                    }
                }
            )
    }
}
