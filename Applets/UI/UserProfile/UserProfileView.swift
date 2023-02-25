//
//  UserProfileView.swift
//  Applets
//
//  Created by シェイミ on 17/02/2023.
//

import SwiftUI

struct UserProfileView: View {
    @State private var firstNameTest: String = "Monty"
    @State private var surnameTest: String = "Python"
    @State private var codiceFiscaleNumberTest: String = "XXXXXXXXXXXXX"
    @State private var emailAddressTest: String = "me@here.com"
    @State private var phoneNumberTest: String = "+39 123 4567890"
    @State private var permessoNumberTest: String = "XXXXXXXXXXXXXXXXXXXXXX"

    @Binding var isEditing: Bool

    var body: some View {
        VStack {
            List {
                Section {
                    Button {
                        print("List button pressed: Name")
                    } label: {
                        Group {
                            if isEditing {
                                TextField("Name", text: $firstNameTest)
                            } else {
                                Text(firstNameTest)
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
                                TextField("Email", text: $emailAddressTest)
                            } else {
                                Text(emailAddressTest)
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
                                TextField("Mobile number", text: $phoneNumberTest)
                            } else {
                                Text(phoneNumberTest)
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
                                TextField("Codice Fiscale", text: $codiceFiscaleNumberTest)
                            } else {
                                Text(codiceFiscaleNumberTest)
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
                                TextField("Permesso di Soggiorno", text: $permessoNumberTest)
                            } else {
                                Text(permessoNumberTest)
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
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
