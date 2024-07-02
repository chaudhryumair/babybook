//
//  RootViewModel.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 24/06/2024.
//

import SwiftUI
import Combine
import Firebase

class RootViewModel : ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        subscriber_Register()
    }
    
    private func subscriber_Register(){
        AuthService.shared.$userSession.sink { userSession in
            self.userSession = userSession
        }.store(in: &cancellable)
    }
    
}
