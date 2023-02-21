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
    init(
        cellTitle: String,
        approxTime: String,
        percentOfDone: Double,
        imageName: String = "placeholder",
        steps: [Step] = []
    ) {
        self.cellTitle = cellTitle
        self.approxTime = approxTime
        self.percentOfDone = percentOfDone
        self.imageName = imageName
        self.steps = steps
    }
}

struct CellView: View {
    var cell: Cell
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray.opacity(0.50))
                .frame(width: 370, height: 100)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text(cell.cellTitle)
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .foregroundColor(.black)
                Text(cell.approxTime)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .foregroundColor(.black)
            }
        }
    }
    func fillDone() {
        var percent: CGFloat = 0.7

        @ViewBuilder
        func cell(_ string: String) -> some View {
            Text(string)
                .padding(.all, 5)
                .background(
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(.green)
                                .frame(width: geometry.size.width * percent, height: geometry.size.height)
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.40))
                                .cornerRadius(20)
                        }
                    }
                )
                .clipShape(Capsule())
        }
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell(cellTitle: "Task name", approxTime: "1-2 weeks", percentOfDone: 0.2))
    }
}
