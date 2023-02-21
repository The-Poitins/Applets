//
//  MainView.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 17/02/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var contentVM = ContentViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(contentVM.goals, id: \.id) { goal in
                    NavigationLink {
                        TaskView(goal: goal)
                            .navigationTitle(goal.title ?? "")
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        CellView(model: goal)
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
        let viewModel = ContentViewModel(dataManager: DataManager.preview)
        ContentView(contentVM: viewModel)
    }
}
