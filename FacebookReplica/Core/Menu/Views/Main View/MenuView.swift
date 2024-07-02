//
//  MenuView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 11/06/2024.
//

import SwiftUI

struct MenuView: View {
   
    @State var showLogoutAlert: Bool = false
    var body: some View {
        NavigationView{
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading){
                        MenuHeaderView()
                        ShortcutsView(width: proxy.size.width)
                        MenuCellView(imageName: "questionmark.circle.fill", title: "Help & Support")
                        MenuCellView(imageName: "gearshape.fill", title: "Settings & Privacy")
                        MenuCellView(imageName: "window.casement.closed", title: "Also from Meta")
                        Button(action: {
                            showLogoutAlert.toggle()
                        }, label: {
                            Text("Logout")
                                .customeViewModifier(width: proxy.size.width)
                            .padding()
                        })
                        
                    }
                   
                }
                .alert("Logout of your account?", isPresented : $showLogoutAlert){
                    Button("Logout"){
                        AuthService.shared.signOutUser()
                    }
                    Button("Cancel", role: .cancel){}

                }
                .background(Color(.systemGray6))
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Menu")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing:24) {
                            Button(action: {}, label: {
                                Image(systemName: "gearshape.fill")
                             })
                            
                            Button(action: {}, label: {
                                Image(systemName: "magnifyingglass")
                             })
                        }
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    }
                }
            }
        }
    }
    }


#Preview {
    MenuView()
}

