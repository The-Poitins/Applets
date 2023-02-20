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
        NavigationStack {
            ScrollView {
                ForEach(contentVM.cells, id: \.id) { cell in
                    NavigationLink {
                        TaskView(taskName: cell.cellTitle, taskImage: cell.imageName)
                            .navigationTitle(cell.cellTitle)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        CellView(cell: cell)
                    }
                }
            }
            .navigationTitle("Your tasks")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
