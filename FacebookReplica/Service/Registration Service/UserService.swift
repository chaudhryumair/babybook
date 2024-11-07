//
//  UserService.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 24/06/2024.
//

import SwiftUI
import Firebase

class UserService {
    @Published var currentUser: User?
    @Published var friends: [User]?
    @Published var friendsRequests: [User]?

    static let shared = UserService()
    
    init () {
        Task{
           try await fetchUser()
           
        }
    }
    
    func resetUser() {
        self.currentUser = nil
        self.friends = nil
        self.friendsRequests = nil 
    }
    
    @MainActor
    func fetchUser() async throws{
        guard let uid =  Auth.auth().currentUser?.uid else {return}
        let snapShot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try snapShot.data(as: User.self)
        try await fetchFriends()
        try await fetchFriendsRequests()
    }
  
    @MainActor
     func uploadProfileImage(withImageUrl imageURL: String) async throws {
        guard let uid =  Auth.auth().currentUser?.uid else {return}
        try await Firestore.firestore().collection("users").document(uid).updateData([
            "profileImageName": imageURL
        ])
     self.currentUser?.profileImageName = imageURL
    }
    
    @MainActor
     func uploadProfileCoverImage(withImageUrl imageURL: String) async throws {
        guard let uid =  Auth.auth().currentUser?.uid else {return}
        try await Firestore.firestore().collection("users").document(uid).updateData([
            "coverImageName": imageURL
        ])
     self.currentUser?.coverImageName = imageURL
    }
    
    @MainActor
    func fetchFriends() async throws {
        let snapShot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapShot.documents.compactMap ({ try? $0.data(as: User.self)})
            guard let friendsIds = self.currentUser?.friendsIds else {return}
            self.friends = users.filter({friendsIds.contains($0.id)})
        

    }
    
    @MainActor
    func fetchFriendsRequests() async throws {
        let snapShot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapShot.documents.compactMap ({ try? $0.data(as: User.self)})
            guard let friendsRequestIds = self.currentUser?.friendsRequestsIds  else {return}
            self.friendsRequests = users.filter({friendsRequestIds.contains($0.id)})
        

    }
}

