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
                VStack {
                    Text(model.title ?? "")
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 4)
                        .foregroundColor(model.isEnabled ? .black : .gray)
                    
                    Text(model.goalDescription ?? "")
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .font(.system(size: 16))
                        .foregroundColor(model.isEnabled ? .gray : .gray.opacity(0.50))
                }
                if model.fractionOfDone < 1 {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(.clear)
                            .modifier(FilledCellModifier(percentOfDone: model.fractionOfDone))
                        //                                .position(x: 182, y: 20)
                        //                            Circle()
                        //                                .foregroundColor(Color("peach"))
                        //                                .frame(width: 8, height: 8)
                        //                                .offset(x: -150 + (model.fractionOfDone * 300), y: 16)
                        //                            Circle()
                        //                                .foregroundColor(.white)
                        //                                .frame(width: 4, height: 4)
                        //                                .offset(x: -150 + (model.fractionOfDone * 300), y: 16)
                        //                        }
                    }
                    .padding(.top, 12)
                    
                    HStack {
                        HStack {
                            Image(systemName: "checkmark.circle")
                            Text(model.percentOfDone == 100 ? "Done" : "\(model.completedSteps.count)/\(model.allSteps.count)")
                                .font(.system(size: 16))
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "clock")
                            Text("\(model.timeFrame ?? "")")
                                .font(.system(size: 16))
                        }
                        Spacer()
                    }
                    .padding(.top, 12)
                    .foregroundColor(model.isEnabled ? .black : .gray)
                }
            }
            .padding(16)
            .background(model.fractionOfDone == 1 ? Color.accentColor : .white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.08), radius: 15, y: 2)
        }
    }
}


struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        let goal = Goal.previewExample(for: 0, in: PersistenceController.preview.context)
        CellView(model: goal)
    }
}
