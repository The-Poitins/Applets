//
//  Cell.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 17/02/23.
//

import SwiftUI

struct Cell: Identifiable {
    let id = UUID()
    let cellTitle: String
    let approxTime: String
    let percentOfDone: Double
    let imageName: String
    let steps: [Step]
    let color = Color.accentColor
    let isEnabled: Bool
    
    init(cellTitle: String, approxTime: String, percentOfDone: Double, imageName: String = "placeholder", steps: [Step] = [], isEnabled: Bool) {
        self.cellTitle = cellTitle
        self.approxTime = approxTime
        self.percentOfDone = percentOfDone
        self.imageName = imageName
        self.steps = steps
        self.isEnabled = isEnabled
    }
}

struct CellView: View {
    var cell: Cell
    var body: some View {
            ZStack {
                if cell.isEnabled {
                    if cell.percentOfDone < 1 {
                        HStack (alignment: .lastTextBaseline) {
                            Text("\(Int(cell.percentOfDone * 100))")
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
                    Text(cell.cellTitle)
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .foregroundColor(cell.isEnabled ? .black : .gray)
                    Text(cell.approxTime)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .foregroundColor(cell.isEnabled ? .black : .gray)
                }
            }
            .frame(width: 370, height: 100)
            .modifier(FilledCell(percentOfDone: cell.percentOfDone))
            .cornerRadius(20)
    }
}


struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell(cellTitle: "10", approxTime: "10", percentOfDone: 0, isEnabled: false))
    }
}
