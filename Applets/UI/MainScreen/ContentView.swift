//
//  ContentView.swift
//  Applets
//
//  Created by Ekaterina Grishina on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var contentVM: ContentViewModel
    var body: some View {
        NavigationView {
            List(contentVM.tasks, id: \.self) { task in
                NavigationLink {
                    TaskView(taskName: task)
                } label: {
                    Text(task)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Your tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contentVM: ContentViewModel())
    }
}
