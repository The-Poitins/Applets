//
//  ProgressBarView.swift
//  Applets
//
//  Created by Ekaterina Grishina on 07/03/23.
//

import SwiftUI

struct ProgressBarView: View {

    let fractionOfDone: Double

    var body: some View {
        ZStack {
                Rectangle()
                    .modifier(FilledCellModifier(percentOfDone: fractionOfDone))
                    .foregroundColor(.clear)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.1), radius: 20, y: 2)
                Text("\(Int(fractionOfDone * 100))% has done")
                .minimumScaleFactor(0.4)
        }
        .frame(height: 25)
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(fractionOfDone: 0.5)
    }
}
