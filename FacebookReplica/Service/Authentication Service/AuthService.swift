//
//  AuthService.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 24/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

final class AuthService: ObservableObject{
    static let shared = AuthService()
    @Published
    var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    // MARK: - SignUP
    
    @MainActor
    private func uploadUserDataToFirebase(withUserFirstName firstName:String , withUserFamilyName familyName: String,withUserEmail email: String, withUserAge age: Int, withUserGender gender: String, withUserID id: String) async throws{
        let user = User(id: id, firstName: firstName, familyName: familyName, email: email, age: age, gender: gender, friendsIds: [], friendsRequestsIds: [], isCurrentUser: true)
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(userData )
        
    }
    
    @MainActor
     func signUpUser(withUserFirstName firstName:String , withUserFamilyName familyName: String,withUserEmail email: String, withUserAge age: Int,withUserPassword password: String,  withUserGender gender: String) async throws{
         do {
             let result = try await Auth.auth().createUser(withEmail: email, password: password)
             AuthService.shared.userSession = result.user
             try await uploadUserDataToFirebase(withUserFirstName: firstName, withUserFamilyName: familyName, withUserEmail: email,
                                                withUserAge: age, withUserGender: gender, withUserID: result.user.uid)
         }
        catch{
            print("DEBUG ERROR: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Login
    
    @MainActor
     func signInUser(withUserEmail email: String, withUserPassword password: String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            AuthService.shared.userSession = result.user
            try await UserService.shared.fetchUser()
           
        }
        catch{
            print("DEBUG ERROR: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Logout
    @MainActor 
    func signOutUser(){
        try? Auth.auth().signOut()
        AuthService.shared.userSession = nil
        UserService.shared.resetUser()
   }
    
    
}

