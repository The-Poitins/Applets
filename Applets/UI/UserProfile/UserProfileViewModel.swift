//
//  UserProfileViewModel.swift
//  Applets
//
//  Created by Ekaterina Grishina on 01/03/23.
//

import SwiftUI
import CoreData

final class UserProfileViewModel: ObservableObject {

    @Published var userProfile: UserProfileModel

    private var dataManager: DataManager
    private var userProfileData: UserProfile?

    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager

        let request = NSFetchRequest<UserProfile>(entityName: "UserProfile")
        do {
            let userProfileData = try dataManager.managedObjectContext.fetch(request).first
            self.userProfileData = userProfileData
            self.userProfile = UserProfileModel.fromCoreData(userProfileData)
        } catch {
            print("Error fetching. \(error)")
            self.userProfile = UserProfileModel(id: UUID())
        }
    }

    func saveChanges() {
        let userData = userProfile.toCoreData(object: self.userProfileData, in: dataManager.managedObjectContext)
        self.userProfileData = userData
        dataManager.saveData()
    }
}
