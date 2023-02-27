//
//  Cell.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 17/02/23.
//

import SwiftUI

struct CellView: View {
    
    @ObservedObject var model: Goal
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(model.title ?? "")
                    .font(.system(size: 20).bold())
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 15)
                    .padding(.top, 25)
                    .padding(1)
                    .foregroundColor(model.isEnabled ? .black : .gray)
                
                Text(model.goalDescription ?? "")
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 15)
                    .foregroundColor(model.isEnabled ? .gray : .gray.opacity(0.50))
                
                if model.fractionOfDone < 1 {
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 3)
                            .foregroundColor(.clear)
                            .modifier(FilledCellModifier(percentOfDone: model.fractionOfDone))
                            .position(x: 182, y: 20)
                        
                        Circle()
                            .foregroundColor(Color("peach"))
                        Circle()
                            .foregroundColor(.white)
                    }
                }
                
                HStack {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("Done")
                    }
                    .padding(30)
                    Spacer()
                    HStack {
                        Image(systemName: "clock")
                        Text("\(model.timeFrame ?? "")")
                    }
                    Spacer()
                }
                .foregroundColor(model.isEnabled ? .black : .gray)
            }
        }
        .frame(width: 370, height: 150)
        .background(model.percentOfDone == 1 ? Color.accentColor : .white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.08), radius: 15, y: 2)
    }
}


struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        let goal = Goal.previewExample(for: 0, in: PersistenceController.preview.context)
        CellView(model: goal)
    }
}
