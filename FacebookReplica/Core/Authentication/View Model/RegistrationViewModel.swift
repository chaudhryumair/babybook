//
//  AddNameViewModel.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 21/06/2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var familyName: String = ""
    @Published var gender: String = ""
    @Published var genderChoices: [String] = ["Female","Male","More Options"]
    @Published var age = ""
    @Published var email = ""
    @Published var password = ""


    // MARK: - create user 
    func createUser() async throws{
        if let age = Int(age){
            try await AuthService.shared.signUpUser(withUserFirstName: firstName, withUserFamilyName: familyName, withUserEmail: email, withUserAge: age, withUserPassword: password, withUserGender: gender)
        }else{
            try await AuthService.shared.signUpUser(withUserFirstName: firstName, withUserFamilyName: familyName, withUserEmail: email, withUserAge: 0, withUserPassword: password, withUserGender: gender)
        }
       
    }
}
