//
//  Cell.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 17/02/23.
//

import SwiftUI

struct CellView: View {
    var model: Goal
    var body: some View {
            ZStack {
                if model.isEnabled {
                    if model.percentOfDone < 1 {
                        HStack(alignment: .lastTextBaseline) {
                            Text("\(Int(model.percentOfDone * 100))")
                                .font(.system(size: 100).bold().weight(.black))
                                .padding(-10)
                            Text("%")
                                .font(.system(size: 40).bold().weight(.black))
                                .padding(5)
                        }
                        .frame(width: 370, height: 100, alignment: .trailing)
                        .foregroundColor(.white.opacity(0.30))
                    } else {
                        Text("DONE")
                            .font(.system(size: 120).bold().weight(.black))
                            .foregroundColor(.white.opacity(0.30))
                    }
                }

                VStack(alignment: .leading) {
                    Text(model.title ?? "")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .foregroundColor(model.isEnabled ? .black : .gray)
                    Text(model.timeFrame ?? "")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .foregroundColor(model.isEnabled ? .black : .gray)
                }
            }
            .frame(width: 370, height: 100)
            .modifier(FilledCellModifier(percentOfDone: model.percentOfDone))
            .cornerRadius(20)
    }
}


struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        let goal = Goal.previewExample(for: 0, in: PersistenceController.preview.context)
        CellView(model: goal)
    }
}
