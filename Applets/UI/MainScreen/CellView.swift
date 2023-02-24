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
                    .foregroundColor(model.isEnabled ? .black : .gray)
                    .padding(1)
                
                Text(model.goalDescription ?? "")
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 15)
                    .foregroundColor(model.isEnabled ? .gray : .gray.opacity(0.50))
                
                if model.percentOfDone != 1 {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: 340, height: 2)
                            .foregroundColor(Color("Peach").opacity(0.40))
                        
                        Rectangle()
                            .frame(width: 150, height: 2)
                            .foregroundColor(Color("Peach"))
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
    }
}


struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        let goal = Goal.previewExample(for: 0, in: PersistenceController.preview.context)
        CellView(model: goal)
    }
}
