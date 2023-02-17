//
//  MainView.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 17/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentVM = ContentViewModel()
    var body: some View {
        NavigationView {
            List(contentVM.tasks, id: \.self) { task in
                NavigationLink {
                    TaskView(taskName: task)
                } label: {
                    Text(task)
                }
                .navigationTitle("Your tasks")
            }
            .listStyle(.plain)
            .navigationTitle("Your tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let cells: [Cell] = [
    Cell(cellTitle: "Codice fiscale", approxTime: "Approx. time 2-4 weeks"),
    Cell(cellTitle: "Accomodation", approxTime: "Approx. time 2-4 weeks"),
    Cell(cellTitle: "Permesso di Sogiorno", approxTime: "Approx. time 2-6 months"),
    Cell(cellTitle: "ADA contract", approxTime: "Approx. time 1-2 weeks"),
    Cell(cellTitle: "Transport in NA", approxTime: "Approx. time 1-2 weeks"),
    Cell(cellTitle: "Mobile operator", approxTime: "Approx. time 1-2 days")
]
