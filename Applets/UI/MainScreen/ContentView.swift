//
//  ContentView.swift
//  Applets
//
//  Created by Ekaterina Grishina on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentVM = ContentViewModel()

    @State private var isShowingProfilePage: Bool = false
    @State private var isEditing: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isShowingProfilePage.toggle()
                    } label: {
                        Image(systemName: "person.circle")

                    }
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .font(.system(size: 50))
                }
                Spacer()
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
            .padding(20)


            .sheet(isPresented: $isShowingProfilePage, onDismiss: { isEditing = false }) {
                NavigationStack {
                    UserProfileView(isEditing: $isEditing)
                        .navigationTitle("User Profile")
                        .toolbar {
                            ToolbarItem(placement: .automatic) {
                                Button {
                                    isEditing.toggle()
                                } label: {
                                    Text("Edit")
                                }
                            }
                        }
                }

            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
