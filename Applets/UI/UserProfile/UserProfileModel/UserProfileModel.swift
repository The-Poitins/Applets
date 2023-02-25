//
//  UserProfileModel.swift
//  Applets
//
//  Created by シェイミ on 25/02/2023.
//

import Foundation

struct UserProfileModel: Identifiable {
    var id = UUID().uuidString
    var firstName: String
    var surname: String
    var emailAddress: String
    var mobileNumber: String
    var codiceFiscaleNumber: String
    var permessoDiSoggiornoNumber: String
}
