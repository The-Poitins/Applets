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
                        Button {
                            print("List button pressed: Name")
                        } label: {
                            Group {
                                if isEditing {
                                    TextField("Name", text: $viewModel.userProfile.firstName.withDefault(""))
                                } else {
                                    Text(viewModel.userProfile.firstName ?? "Monty")
                                }
                            }
                            .redacted(reason: isEditing ? .privacy : .placeholder)
                        }
                    } header: {
                        Text("Name")
                    }
                    
                    Section {
                        Button {
                            print("List button pressed: Email")
                        } label: {
                            Group {
                                if isEditing {
                                    TextField("Email", text: $viewModel.userProfile.emailAddress.withDefault(""))
                                } else {
                                    Text(viewModel.userProfile.emailAddress ?? "me@here.com")
                                }
                            }
                            .redacted(reason: isEditing ? .privacy : .placeholder)
                        }
                    } header: {
                        Text("Email")
                    }
                    
                    Section {
                        Button {
                            print("List button pressed: Mobile number")
                        } label: {
                            Group {
                                if isEditing {
                                    TextField("Mobile number", text: $viewModel.userProfile.mobileNumber.withDefault(""))
                                } else {
                                    Text(viewModel.userProfile.mobileNumber ?? "+39 123 4567890")
                                }
                            }
                            .redacted(reason: isEditing ? .privacy : .placeholder)
                        }
                    } header: {
                        Text("Mobile number")
                    }
                    
                    Section {
                        Button {
                            print("List button pressed: Codice Fiscale")
                        } label: {
                            Group {
                                if isEditing {
                                    TextField("Codice Fiscale", text: $viewModel.userProfile.codiceFiscaleNumber.withDefault(""))
                                } else {
                                    Text(viewModel.userProfile.codiceFiscaleNumber ?? "XXXXXXXXXXXXX")
                                }
                            }
                            .redacted(reason: isEditing ? .privacy : .placeholder)
                        }
                    } header: {
                        Text("Codice Fiscale")
                    }
                    
                    Section {
                        Button {
                            print("List button pressed: Permesso di Soggiorno")
                        } label: {
                            Group {
                                if isEditing {
                                    TextField("Permesso di Soggiorno", text: $viewModel.userProfile.permessoDiSoggiornoNumber.withDefault(""))
                                } else {
                                    Text(viewModel.userProfile.permessoDiSoggiornoNumber ?? "XXXXXXXXXXXXX")
                                }
                            }
                            .redacted(reason: isEditing ? .privacy : .placeholder)
                        }
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
