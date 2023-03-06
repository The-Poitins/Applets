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

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(contentVM.goals, id: \.id) { goal in
                    if goal.isEnabled {
                        NavigationLink {
                            TaskView(goal: goal)
                                .navigationTitle(goal.title ?? "")
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            CellView(model: goal)
                                .padding(.horizontal, 16)
                                .padding(.bottom)
                        }
                    } else {
                        CellView(model: goal)
                            .padding(.horizontal, 16)
                            .padding(.bottom)
                    }
                }
            }
            .padding(.top, 8)
            .navigationTitle("Your tasks")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("yellowColor").opacity(0.10))
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingProfilePage.toggle()
                    } label: {
                        Image(systemName: "person.circle")
                    }
                    .font(.title)
                }
            }
            .sheet(isPresented: $isShowingProfilePage) {
                UserProfileView()
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
