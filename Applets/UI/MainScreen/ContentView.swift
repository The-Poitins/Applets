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
            ScrollView {
                ForEach(contentVM.cells, id: \.id) { cell in
                    NavigationLink {
                        TaskView(taskName: cell.cellTitle)
                    } label: {
                        CellView(cell: cell)
                    }
                }
            }
            .navigationTitle("Your tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


