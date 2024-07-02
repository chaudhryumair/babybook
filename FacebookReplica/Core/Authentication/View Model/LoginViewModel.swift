//
//  LoginViewModel.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 21/06/2024.
//

import Foundation


class LoginViewModel: ObservableObject{

   @Published var email = ""
   @Published var password = ""
    
    
    func login() async throws{
        try await AuthService.shared.signInUser(withUserEmail: email, withUserPassword: password)

    }

}
