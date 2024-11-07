//
//  FirendsViewModel.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 29/06/2024.
//

import Foundation
import Observation
import Combine

@Observable
class FriendsViewModel {
     
    
    var friendsRequest: [User] = []
    private var cancellable = Set<AnyCancellable>()
    
        init(){
            setupFriends()
        }
    
    private func setupFriends() {
        UserService.shared.$friendsRequests.sink { [weak self] friendRequest in
            self?.friendsRequest = friendRequest ?? []
        }.store(in: &cancellable)
        
    }
}
