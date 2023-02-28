//
//  CircledProgressBar.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 28/02/23.
//

import SwiftUI

struct CircledProgressBar: ViewModifier {
    var percentOfDone: Double

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color("peach"))
                            .frame(
                                width: CGFloat(percentOfDone) * geometry.size.width + 2,
                                height: geometry.size.height
                            )
                            .cornerRadius(geometry.size.height / 2)
                        Rectangle()
                            .fill(Color("peach").opacity(0.3))
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .cornerRadius(geometry.size.height / 2)
                        ZStack {
                            Circle()
                                .foregroundColor(Color("peach"))
                                .frame(width: 10, height: 10)
                                .offset(x: percentOfDone * geometry.size.width)
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 4, height: 4)
                                .offset(x: percentOfDone * geometry.size.width)
                        }
                    }
                }
            )
    }
}
