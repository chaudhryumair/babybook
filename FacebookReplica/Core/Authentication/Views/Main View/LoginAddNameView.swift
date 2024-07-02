//
//  AddNameView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 21/06/2024.
//

import SwiftUI

struct LoginAddNameView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject private var viewModel = RegistrationViewModel()

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 24) {
                Text("What`s your name?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("Enter the name you use in real life. ")
                    .font(.footnote)
                HStack{ 
                    TextField("First Name", text: $viewModel.firstName)
                        .textInputAutocapitalization(.never)
                        .customTextfieldViewModifier(width: proxy.size.width/2 )
                    Spacer()
                    TextField("Surname", text: $viewModel.familyName)
                        .textInputAutocapitalization(.never)
                        .customTextfieldViewModifier(width: proxy.size.width/2 )
                }
                NavigationLink {
                    LoginAgeView(viewModel: viewModel)
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
    LoginAddNameView()
}
