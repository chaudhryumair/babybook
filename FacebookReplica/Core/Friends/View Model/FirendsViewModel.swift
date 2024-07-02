//
//  FirendsViewModel.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 29/06/2024.
//

import Foundation
import Observation

@Observable
class FriendsViewModel {
    var users: [User] = [
        .init(id: "0", firstName: "Atir ", familyName: "Chauhdry", email: "atirchauhdry007@yahoo.com",profileImageName: "profilePic1", age: 2, gender: "male", friendsIds: ["3"], friendsRequestsIds: ["1", "2", "4"] , isCurrentUser: true),
        .init(id: "1", firstName: "Hunain ", familyName: "Chauhdry", email: "hunainchauhdry007@yahoo.com",profileImageName: "profilePic", age: 12, gender: "male", friendsIds: [], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "2", firstName: "mash ", familyName: "Chauhdry", email: "mashchauhdry007@yahoo.com",profileImageName: "profilePic2", age: 18, gender: "male", friendsIds: [], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "3", firstName: "Abuwaff ", familyName: "Chauhdry", email: "abuwaffchauhdry007@yahoo.com",profileImageName: "profilePic3", age: 25, gender: "male", friendsIds: ["0"], friendsRequestsIds: [] , isCurrentUser: true),
        .init(id: "4", firstName: "Abuwaff ", familyName: "Chauhdry", email: "abuwaffchauhdry007@yahoo.com",profileImageName: "profilePic4", age: 25, gender: "male", friendsIds: [], friendsRequestsIds: [] , isCurrentUser: false)
    ]
    
    var friendsRequest: [User] = []
    
        init(){
            setupFriends()
        }
    
    private func setupFriends() {
        self.friendsRequest = self.users.filter{
            self.users[0]
            .friendsRequestsIds
            .contains( $0.id)
        }
        
    }
}
