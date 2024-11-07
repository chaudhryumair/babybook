//
//  FeedViewModel.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 29/06/2024.
//

import Foundation
import PhotosUI
import SwiftUI
import Combine

class FeedViewModel : ObservableObject{
    
    @Published var myPostIndexes: [Int] = []
    @Published var friends: [User] = []
    @Published var selectedImage: PhotosPickerItem?{
        didSet{
            Task{
                try await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var selectedCoverImage: PhotosPickerItem?{
        didSet{
            Task{
                try await loadCoverImage(fromItem: selectedCoverImage)
            }
        }
    }

    @Published var profileImage:Image = Image("no_profile")  
    @Published var coverImage:Image = Image("no_profile")
    @Published var currentUser:User?
    private var cancellable = Set<AnyCancellable>()

    @Published var uiImage: UIImage?

    
    @Published var users: [User] = [
        .init(id: "0", firstName: "Atir ", familyName: "Chauhdry", email: "atirchauhdry007@yahoo.com",profileImageName: "profilePic1",coverImageName: "cover_picture", age: 2, gender: "male", friendsIds: ["3","5","6","7"], friendsRequestsIds: ["4","6","7"] , isCurrentUser: true),
        .init(id: "1", firstName: "Hunain ", familyName: "Chauhdry", email: "hunainchauhdry007@yahoo.com",profileImageName: "profilePic",coverImageName: "", age: 12, gender: "male", friendsIds: [], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "2", firstName: "munam ", familyName: "Chauhdry", email: "mashchauhdry007@yahoo.com",profileImageName: "profilePic2", age: 18, gender: "male", friendsIds: [], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "3", firstName: "Aw ", familyName: "Chauhdry", email: "abuwaffchauhdry007@yahoo.com",profileImageName: "profilePic3",coverImageName: "Story1", age: 25, gender: "male", friendsIds: ["0"], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "4", firstName: "Aw ", familyName: "Chauhdry", email: "abuwaffchauhdry007@yahoo.com",profileImageName: "profilePic4", age: 25, gender: "male", friendsIds: [], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "5", firstName: "raashi ", familyName: "Chauhdry", email: "rashichauhdry007@yahoo.com",profileImageName: "profilePic4",coverImageName: "Story2", age: 32, gender: "Female", friendsIds: ["0"], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "6", firstName: "khan", familyName: "Chauhdry", email: "rashichauhdry007@yahoo.com",profileImageName: "profilePic",coverImageName: "Story3", age: 32, gender: "Female", friendsIds: ["0"], friendsRequestsIds: [] , isCurrentUser: false),
        .init(id: "7", firstName: "doctor", familyName: "Chauhdry", email: "rashichauhdry007@yahoo.com",profileImageName: "profilePic",coverImageName: "Story4", age: 32, gender: "Female", friendsIds: ["0"], friendsRequestsIds: [] , isCurrentUser: false)
    ]
    
  
   @Published var posts: [Post] = [
        .init(id: "0", userId: "3", postTitle: "Lorem epsom Lorem epsom Lorem epsom", postLikes: 2, postShares: 10, postUrl: "office", isVideo: false ),
        .init(id: "1", userId: "0", postTitle: "Lorem epsom Lorem epsom Lorem epsom", postLikes: 12, postShares: 10, postUrl: "stadium", isVideo: false ),
    ]
    

    init() {
         UserService.shared.$currentUser.sink { [weak self] currentuser in
            self?.currentUser = currentuser
        }.store(in: &cancellable)
        setupFriends()
        setupPost()
    }
    
    private func setupFriends() {
        UserService.shared.$friends.sink { [weak self] friends in
           self?.friends = friends ?? []
       }.store(in: &cancellable)
    }
    
    private func setupPost() {
        for index in 0 ..< posts.count {
            
            posts[index].users = users.first(where:{ $0.id == posts[index].userId  })
            
            if posts[index].users == users.first{
                    myPostIndexes.append(index)
                }
          
        }
    }
    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async throws{
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
        try await updateProfileImageName ()
    }
    @MainActor
    func loadCoverImage(fromItem item: PhotosPickerItem?) async throws{
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.coverImage = Image(uiImage: uiImage)
        try await updateProfileCoverImageName ()
    }
    private func updateProfileImageName () async throws{
        guard let image = self.uiImage else { return }
        guard let imageUrl = try await ImageUploader.uploadImage(image) else {return}
        try await UserService.shared.uploadProfileImage(withImageUrl: imageUrl)
        self.currentUser?.profileImageName = imageUrl
    }
    private func updateProfileCoverImageName () async throws{
        guard let image = self.uiImage else { return }
        guard let imageUrl = try await ImageUploader.uploadCoverImage(image) else {return}
        try await UserService.shared.uploadProfileCoverImage(withImageUrl: imageUrl)
        self.currentUser?.coverImageName = imageUrl

    }


}
