//
//  ContentView.swift
//  Applets
//
//  Created by Ekaterina Grishina on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentVM = ContentViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                    .scaledToFill()
                    .opacity(0.2)
                ScrollView {
                    ForEach(contentVM.tasks, id: \.self) { task in
                        NavigationLink {
                            TaskView(taskName: task)
                                .navigationTitle(task)
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            Text(task)
                        }
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
