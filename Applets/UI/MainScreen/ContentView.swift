//
//  MainView.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 17/02/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var contentVM = ContentViewModel()

    @State private var isShowingProfilePage = false
    @State private var isEditing = false

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
                            .padding(.horizontal, 16)
                            .padding(.bottom)
                    }
                }
            }
            .padding(.top, 8)
            .navigationTitle("Your tasks")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.accentColor.opacity(0.10))
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingProfilePage.toggle()
                    } label: {
                        Image(systemName: "person.circle")
                            .foregroundColor(.accentColor)
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
        let viewModel = ContentViewModel(dataManager: DataManager.preview)
        ContentView(contentVM: viewModel)
    }
}
