//
//  LoginPasswordView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 23/06/2024.
//

import SwiftUI

struct LoginPasswordView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject private var viewModel = RegistrationViewModel()
    
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 24) {
                Text("Create a Password")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                Text("Create a password with atleast 6 letters or numbers. It should be something that others can`t guess.")
                    .font(.caption)
           
                    SecureField("Password", text: $viewModel.password)
                    .textInputAutocapitalization(.never)
                        .customTextfieldViewModifier(width: proxy.size.width )
                VStack{
                    NavigationLink {
                        
                        LoginAgreementView(viewModel: viewModel)

                        
                    } label: {
                        Text("Next")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: proxy.size.width - 25, height: 44 )
                            .background(.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .padding(.vertical)
                        
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                    Spacer()
                }
            }
            .padding()
            .toolbar{
                ToolbarItem( placement: .topBarLeading) {
                    Image(systemName: "arrow.backward")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
                }
            }
        .background(Color(.systemGray5))
        }
        
    }
}

#Preview {
    LoginPasswordView(viewModel: RegistrationViewModel())
}
