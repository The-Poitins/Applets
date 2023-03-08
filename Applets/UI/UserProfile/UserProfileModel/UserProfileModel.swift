//
//  UserProfileModel.swift
//  Applets
//
//  Created by シェイミ on 25/02/2023.
//

import Foundation
import CoreData

struct UserProfileModel: Identifiable {
    var id: UUID
    var firstName: String?
    var surname: String?
    var emailAddress: String?
    var mobileNumber: String?
    var codiceFiscaleNumber: String?
    var permessoDiSoggiornoNumber: String?
    var isEUCitizen: Bool?
}

extension UserProfileModel {

    func toCoreData(object: UserProfile? = nil, in context: NSManagedObjectContext) -> UserProfile {
        let userProfile = object ?? UserProfile(context: context)
        userProfile.id = self.id
        userProfile.firstName = self.firstName
        userProfile.surname = self.surname
        userProfile.email = self.emailAddress
        userProfile.mobileNumber = self.mobileNumber
        userProfile.codiceFiscale = self.codiceFiscaleNumber
        userProfile.permesso = self.permessoDiSoggiornoNumber
        userProfile.isEUCitizen = self.isEUCitizen ?? false
        return userProfile
    }

    static func fromCoreData(_ object: UserProfile?) -> UserProfileModel {
        guard let object else {
            return UserProfileModel(id: UUID())
        }

        return UserProfileModel(
            id: object.id ?? UUID(),
            firstName: object.firstName,
            surname: object.surname,
            emailAddress: object.email,
            mobileNumber: object.mobileNumber,
            codiceFiscaleNumber: object.codiceFiscale,
            permessoDiSoggiornoNumber: object.permesso,
            isEUCitizen: object.isEUCitizen
        )
    }
}
