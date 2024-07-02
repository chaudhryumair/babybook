//
//  Post.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 27/06/2024.
//


import Foundation
import Firebase

struct Post: Identifiable,Hashable,Codable {
    let id: String
    let userId: String
    let postTitle: String
    let postLikes: Int
    let postShares: Int
    let postUrl: String
    let isVideo: Bool
   // let timestamp: Timestamp
    var users: User?
}
