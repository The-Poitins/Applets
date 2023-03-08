//
//  UserProfileView.swift
//  Applets
//
//  Created by シェイミ on 17/02/2023.
//

import SwiftUI

struct UserProfileView: View {

    @StateObject private var viewModel = UserProfileViewModel()

    @State private var isEditing = false

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        SecureTextField(
                            placeholder: "Name",
                            data: $viewModel.userProfile.firstName,
                            isEditing: $isEditing)
                    } header: {
                        Text("Name")
                    }

                    Section {
                        SecureTextField(
                            placeholder: "Email",
                            data: $viewModel.userProfile.emailAddress,
                            isEditing: $isEditing)
                    } header: {
                        Text("Email")
                    }

                    Section {
                        SecureTextField(
                            placeholder: "Mobile number",
                            data: $viewModel.userProfile.mobileNumber,
                            isEditing: $isEditing)
                    } header: {
                        Text("Mobile number")
                    }

                    Section {
                        SecureTextField(
                            placeholder: "Codice Fiscale",
                            data: $viewModel.userProfile.codiceFiscaleNumber,
                            isEditing: $isEditing)
                    } header: {
                        Text("Codice Fiscale")
                    }

                    Section {
                        SecureTextField(
                            placeholder: "Permesso di Soggiorno",
                            data: $viewModel.userProfile.permessoDiSoggiornoNumber,
                            isEditing: $isEditing)
                    } header: {
                        Text("Permesso di Soggiorno")
                    } footer: {
                        Text("[Privacy Policy](https://github.com/The-Poitins/Applets/blob/dev/Privacy%20policy.md)")
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("User Profile")
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button {
                            isEditing.toggle()
                            if !isEditing {
                                viewModel.saveChanges()
                            }
                        } label: {
                            Text(isEditing ? "Done" : "Edit")
                        }
                    }
                }
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
