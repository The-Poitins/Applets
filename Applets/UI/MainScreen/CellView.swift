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
                            .frame(height: 4)
                            .foregroundColor(.clear)
                            .modifier(CircledProgressBar(percentOfDone: model.fractionOfDone))
                    }
                    .padding(.top, 12)
                }

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
            .padding(16)
            .background(model.fractionOfDone == 1 ? Color("yellowColor") : .white)
            .overlay(model.isEnabled ? .clear : .white.opacity(0.6))
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
