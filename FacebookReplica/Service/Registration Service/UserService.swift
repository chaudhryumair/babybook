//
//  UserService.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 24/06/2024.
//

import SwiftUI
import Firebase

@MainActor
class UserService {
    
    @Published var currentUser: User?
    static let shared = UserService()
    
    
    func fetchUser() async throws{
        guard let uid =  Auth.auth().currentUser?.uid else {return}
        let snapShot = try await Firestore.firestore().collection("useres").document(uid).getDocument()
        self.currentUser = try snapShot.data(as: User.self)
        
    }
    func resetUser() {
        self.currentUser = nil
    }
}

