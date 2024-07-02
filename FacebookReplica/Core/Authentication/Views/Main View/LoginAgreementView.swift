//
//  LoginAgreementView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 23/06/2024.
//

import SwiftUI

struct LoginAgreementView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject private var viewModel = RegistrationViewModel()
    init(viewModel: RegistrationViewModel = RegistrationViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading , spacing: 20){
                Text("Agree to Facebook`s terms and policies")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
              (  Text("People how use our service may have uploaded your contact information to Facebook. ")
                    .font(.caption)  +
                 Text("Learn More \n\n")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)  +
                 Text("By tapping ")
                    .font(.caption)  +
                 Text("I agree,")
                    .font(.caption)
                    .fontWeight(.bold) +
                 Text("you agree to create an account and to Facebook`s ")
                    .font(.caption)  +
                 Text("terms, Privacy Policy")
                    .font(.caption)
                    .foregroundStyle(.blue)  +
                 Text(" and ")
                    .font(.caption)  +
                 Text("Cookies Policy \n\n")
                    .font(.caption)
                    .foregroundStyle(.blue)  +
                 Text("The Privacy Policy describes the way we can use the information we collect when you create an account. For example, we use this information to provide ,personalise and improve your products, including ads. ")
                    .font(.caption)
                 
                )
                Button {
                    Task{                
                        try await viewModel.createUser()
                    }
//                    Tabview()
//                        .navigationBarBackButtonHidden()
                    
                } label: {
                    Text("I agree")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width - 25, height: 44 )
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.top)
                }
              
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {}) {
                        Text("Already have an account?")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                    }
                    
                    Spacer()
                }
                
            }
            .padding()
            .toolbar{
                leadingItem()
            }
        .background(Color(.systemGray5 ))
        }
    }
    
}
// MARK: - Create ToolbarItem
extension LoginAgreementView{
    @ToolbarContentBuilder
    private func leadingItem() -> some ToolbarContent{
        ToolbarItem(placement: .topBarLeading){
            Image(systemName: "arrow.backward")
                .imageScale(.large)
                .onTapGesture {
                    dismiss()
            }
        }
    }

    
}

#Preview {
    LoginAgreementView(viewModel: RegistrationViewModel())
}
