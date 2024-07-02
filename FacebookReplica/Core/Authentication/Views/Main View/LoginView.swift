//
//  LoginView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 21/06/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
   
    var body: some View {
        NavigationStack{
            GeometryReader { proxy in
                VStack(spacing: 70){
                    Spacer()
                    Image("Facebook_Circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                    VStack(spacing:24){
                        TextField("Mobile number or Email address", text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                            .customTextfieldViewModifier(width: proxy.size.width )
                        TextField("Password", text: $viewModel.password)
                            .textInputAutocapitalization(.never)
                            .customTextfieldViewModifier(width: proxy.size.width )
                        Button(action: {
                            Task{
                                try await viewModel.login()
                            }
                        }, label: {
                            Text("Log In")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: abs(proxy.size.width - 30), height: 44)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 30))

                            
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Forgotten Password ?")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                        })
                    }
                   
                    HStack{Spacer()}
                    Spacer()
                    VStack(spacing: 24){
                        NavigationLink {
                        LoginAddNameView()
                                .navigationBarBackButtonHidden()
                    } label: {
                        Text("Create New Acccount")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: proxy.size.width - 30, height: 44)
                        
                            .overlay{
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.blue, lineWidth: 1)
                            }
                    }
                        HStack(spacing: 5){
                            Image("meta")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16, height: 16)
                            Text("Meta")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(Color(.darkGray))
                    }
                    

                }
                .background(Color(.systemGray5))
            }
        }
    }
}

#Preview {
    LoginView()
}
