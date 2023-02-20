//
//  ContentView.swift
//  Applets
//
//  Created by Ekaterina Grishina on 16/02/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var contentVM = ContentViewModel()

    var body: some View {
        NavigationView {
            List(contentVM.tasks, id: \.self) { task in
                NavigationLink {
                    TaskView(taskName: task.title ?? "")
                } label: {
                    Text(task.title ?? "")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Your tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ContentViewModel(dataManager: TasksDataManager.preview)
        ContentView(contentVM: viewModel)
    }
}
