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
    let color = Color.accentColor
    
    init(cellTitle: String, approxTime: String, percentOfDone: Double) {
        self.cellTitle = cellTitle
        self.approxTime = approxTime
        self.percentOfDone = percentOfDone
    }
}

struct CellView: View {
    var cell: Cell
    
    var body: some View {
        ZStack {
            Text("\(Int(cell.percentOfDone * 100))%")
                .frame(width: 370, height: 100, alignment: .trailing)
                .font(.system(size: 100).bold())
                .foregroundColor(.white.opacity(0.30))
            
            VStack(alignment: .leading) {
                Text(cell.cellTitle)
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .foregroundColor(.black)
                Text(cell.approxTime)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .foregroundColor(.black)
            }
        }
        .frame(width: 370, height: 100)
        .modifier(FilledCell(percentOfDone: cell.percentOfDone))
        .cornerRadius(20)
    }
}

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


struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell(cellTitle: "10", approxTime: "10", percentOfDone: 0.20))
    }
}


