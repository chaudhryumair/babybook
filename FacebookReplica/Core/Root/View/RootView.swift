//
//  RootView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 24/06/2024.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = RootViewModel()
    
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                Tabview()
            }else{
                LoginView()
            }
        }
     }
}

#Preview {
    RootView()
}
