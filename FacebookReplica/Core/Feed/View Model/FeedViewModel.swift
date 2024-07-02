//
//  FeedViewModel.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 29/06/2024.
//

import Foundation

class FeedViewModel : ObservableObject{
    @Published var users: [User] = [
        .init(id: "0", firstName: "Atir ", familyName: "Chauhdry", email: "atirchauhdry007@yahoo.com",profileImageName: "profilePic1",coverImageName: "cover_picture", age: 2, gender: "male", friendsIds: ["3","5","6","7"], friendsRequestsIds: ["4","6","7"] , isCurrentUser: true),
        .init(id: "1", firstName: "Hunain ", familyName: "Chauhdry", email: "hunainchauhdry007@yahoo.com",profileImageName: "profilePic",coverImageName: "", age: 12, gender: "male", friendsIds: [], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "2", firstName: "mash ", familyName: "Chauhdry", email: "mashchauhdry007@yahoo.com",profileImageName: "profilePic2", age: 18, gender: "male", friendsIds: [], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "3", firstName: "Abuwaff ", familyName: "Chauhdry", email: "abuwaffchauhdry007@yahoo.com",profileImageName: "profilePic3",coverImageName: "Story1", age: 25, gender: "male", friendsIds: ["0"], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "4", firstName: "Abuwaff ", familyName: "Chauhdry", email: "abuwaffchauhdry007@yahoo.com",profileImageName: "profilePic4", age: 25, gender: "male", friendsIds: [], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "5", firstName: "raashi ", familyName: "Chauhdry", email: "rashichauhdry007@yahoo.com",profileImageName: "profilePic4",coverImageName: "Story2", age: 32, gender: "Female", friendsIds: ["0"], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "6", firstName: "huush ", familyName: "Chauhdry", email: "rashichauhdry007@yahoo.com",profileImageName: "profilePic",coverImageName: "Story3", age: 32, gender: "Female", friendsIds: ["0"], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "7", firstName: "doctor ", familyName: "Chauhdry", email: "rashichauhdry007@yahoo.com",profileImageName: "profilePic",coverImageName: "Story4", age: 32, gender: "Female", friendsIds: ["0"], friendsRequestsIds: [] , isCurrentUser: false)
    ]
    
   @Published var friends: [User] = []
   @Published var posts: [Post] = [
        .init(id: "0", userId: "4", postTitle: "Lets see raaashi all the time bros", postLikes: 2, postShares: 10, postUrl: "office", isVideo: false ),
        .init(id: "1", userId: "2", postTitle: "We love rashi guys ,thanks to you bharti singh", postLikes: 12, postShares: 10, postUrl: "stadium", isVideo: false ),
        .init(id: "2", userId: "1", postTitle: "Lollls, sounds perfect", postLikes: 12, postShares: 10, postUrl: "apartment1", isVideo: false )
    ]

    init(){
        setupFriends()
        setupPost()
    }
    
    private func setupFriends() {
        self.friends = self.users.filter{
            self.users[0]
            .friendsIds
            .contains( $0.id)
        }
    }
    private func setupPost() {
        for index in 0 ..< posts.count {
            posts[index].users = users.first(where:
              { $0.id == posts[index].userId
            }
            )
        }
    }
     
}
