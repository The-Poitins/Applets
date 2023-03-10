//
//  MainView.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 17/02/23.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @StateObject var contentVM = ContentViewModel()

    @State private var isShowingProfilePage = false
    @State private var firstRun: Bool = {
        LocalStorage.value(for: LocalStorageKey.isFirstRun) ?? true
    }()

    var body: some View {
        if firstRun {
            OnBoarding(firstRun: $firstRun.onChange({ newValue in
                LocalStorage.write(value: newValue, for: LocalStorageKey.isFirstRun)
            }))
        } else {
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
                .scrollIndicators(.hidden)
                .padding(.top, 8)
                .navigationTitle("Your tasks")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("yellowColor").opacity(0.10))
                .toolbar {
                    ToolbarItem {
                        Button {
                            authenticate()
                        } label: {
                            Image(systemName: "person.circle")
                        }
                        .font(.title)
                    }
                }
            }
            .sheet(isPresented: $isShowingProfilePage) {
                UserProfileView()
            }
        }
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?
        let reason = "We need to verify your identity to display sensitive information."

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            authenticateUser(with: context, reason: reason, policy: .deviceOwnerAuthenticationWithBiometrics)
        } else if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            // it's possible, so go ahead and use it
            authenticateUser(with: context, reason: reason, policy: .deviceOwnerAuthentication)
        } else {
            // no authentication
            print("No authentication")
        }
    }

    private func authenticateUser(with context: LAContext, reason: String, policy: LAPolicy) {
        // Use .deviceOwnerAuthenticationWithBiometrics for only biometrics, no passcode access.
        context.evaluatePolicy(policy, localizedReason: reason) { success, error in
            // authentication has now completed
            if success {
                // authenticated successfully
                isShowingProfilePage.toggle()
            } else if let error = error as? LAError, error.code == .biometryNotAvailable {
                authenticate()
            } else {
                // there was a problem
                print("Authentication failed")
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
