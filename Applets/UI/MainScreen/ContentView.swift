//
//  ContentView.swift
//  Applets
//
//  Created by Ekaterina Grishina on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingProfilePage: Bool = false

    @State private var isEditing: Bool = false

    var body: some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
