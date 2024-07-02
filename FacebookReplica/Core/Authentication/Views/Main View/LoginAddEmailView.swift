//
//  LoginAddEmailView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 23/06/2024.
//

import SwiftUI

struct LoginAddEmailView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject private var viewModel = RegistrationViewModel()
    
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 24) {
                Text("What`s your email address ")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("Enter the email address at which you can be contacted.No one will see this on your phone")
                      .font(.footnote)
              
           
                    TextField("Email Address ", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                        .customTextfieldViewModifier(width: proxy.size.width )
                Text("You`ll also receive emails from us and can opt out anytime\n")
                      .font(.caption) +
                Text("Learn More")
                   .font(.caption2)
                   .fontWeight(.semibold)
                   .foregroundStyle(.blue)
                VStack{
                    NavigationLink {
                        LoginPasswordView(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
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
                    Text("Signup with mobile number ")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width - 25, height: 44 )
                        .background(.white)
                        .foregroundColor(Color(.darkGray))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
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
    LoginAddEmailView(viewModel: RegistrationViewModel())
}
