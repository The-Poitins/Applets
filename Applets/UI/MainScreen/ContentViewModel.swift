//
//  ContentViewModel.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import Foundation

final class ContentViewModel: ObservableObject {
    let cells: [Cell] = [
        Cell(cellTitle: "Codice fiscale", approxTime: "Approx. time 2-4 weeks", percentOfDone: 10),
        Cell(cellTitle: "Accomodation", approxTime: "Approx. time 2-4 weeks", percentOfDone: 10),
        Cell(cellTitle: "Permesso di Sogiorno", approxTime: "Approx. time 2-6 months", percentOfDone: 0),
        Cell(cellTitle: "ADA contract", approxTime: "Approx. time 1-2 weeks", percentOfDone: 30),
        Cell(cellTitle: "Transport in NA", approxTime: "Approx. time 1-2 weeks", percentOfDone: 10),
        Cell(cellTitle: "Mobile operator", approxTime: "Approx. time 1-2 days", percentOfDone: 0)
    ]
}
