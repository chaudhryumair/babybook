//
//  LoginAgeView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 22/06/2024.
//

import SwiftUI

struct LoginAgeView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject private var viewModel = RegistrationViewModel()
    
    init(viewModel: RegistrationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel) 
    }

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 24) {
                Text("How old are you?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
              
           
                    TextField("Age", text: $viewModel.age)
                    .keyboardType(.numberPad)
                    .textInputAutocapitalization(.never)
                        .customTextfieldViewModifier(width: proxy.size.width )
                VStack{
                    NavigationLink {
                        LoginGenderView(viewModel: viewModel)
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
                    Text("User date of birth")
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
    LoginAgeView(viewModel: RegistrationViewModel())
}
