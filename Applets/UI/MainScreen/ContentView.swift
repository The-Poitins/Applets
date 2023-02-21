//
//  MainView.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 17/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentVM = ContentViewModel()

    @State private var isShowingProfilePage: Bool = false
    @State private var isEditing: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(contentVM.cells, id: \.id) { cell in
                    NavigationLink {
                        TaskView(taskName: cell.cellTitle, taskImage: cell.imageName, steps: cell.steps)
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
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingProfilePage.toggle()
                    } label: {
                        Image(systemName: "person.circle")
                    }
                    .foregroundColor(.secondary)
                    .font(.title)
                }
            }
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
