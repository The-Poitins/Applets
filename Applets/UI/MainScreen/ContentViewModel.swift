//
//  ContentViewModel.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import Foundation

final class ContentViewModel: ObservableObject {
    let cells: [Cell] = [
        Cell(cellTitle: "Codice fiscale", approxTime: "Approx. time 2-4 weeks", percentOfDone: 0.94, isEnabled: true),
        Cell(cellTitle: "Accomodation", approxTime: "Approx. time 2-4 weeks", percentOfDone: 0, isEnabled: false),
        Cell(cellTitle: "Permesso di Sogiorno", approxTime: "Approx. time 2-6 months", percentOfDone: 0.14, isEnabled: true),
        Cell(cellTitle: "ADA contract", approxTime: "Approx. time 1-2 weeks", percentOfDone: 1, isEnabled: true),
        Cell(cellTitle: "Transport in NA", approxTime: "Approx. time 1-2 weeks", percentOfDone: 0, isEnabled: false),
        Cell(cellTitle: "Mobile operator", approxTime: "Approx. time 1-2 days", percentOfDone: 0, isEnabled: false)
    ]
}
