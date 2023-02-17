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
    
    init(cellTitle: String, approxTime: String) {
        self.cellTitle = cellTitle
        self.approxTime = approxTime
    }
}

struct CellView: View {
    var cell: Cell
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray.opacity(0.40))
                .frame(width: 370, height: 100)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text(cell.cellTitle)
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                Text(cell.approxTime)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
            }
        }
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell(cellTitle: "10", approxTime: "10"))
    }
}


