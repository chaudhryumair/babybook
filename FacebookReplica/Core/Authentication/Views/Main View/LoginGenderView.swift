//
//  LoginGenderView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 22/06/2024.
//

import SwiftUI

struct LoginGenderView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject private var viewModel = RegistrationViewModel()
    init(viewModel: RegistrationViewModel = RegistrationViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)    }

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20){
                Text("What`s your gender ?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("You can change who can see you gender on your profile later.")
                    .font(.footnote)
                VStack(alignment: .leading, spacing: 24){
                    ForEach(viewModel.genderChoices, id: \.self){ choice in
                        Button(action: {
                            print(choice)
                            viewModel.gender = choice
                        }, label: {
                            HStack {
                                VStack(alignment: .leading){
                                    Text(choice)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                    if choice == "More Options"{
                                        Text("Select more options to choose another gender or if you`d rather not say")
                                            .font(.footnote)
                                            .foregroundStyle(Color(.darkGray))
                                            .padding(.trailing)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                Spacer()
                                Circle()
                                    .stroke(viewModel.gender == choice ? .blue : .gray ,lineWidth:1)
                                    .frame(width: 18, height: 18)
                                    .overlay{
                                        Circle()
                                            .frame(width: 12, height: 12)
                                            .foregroundStyle((viewModel.gender == choice ? .blue : .clear))
                                    }
                            }
                        })
                      
                       
                    }
                }
                .padding(10)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                NavigationLink {
                   LoginAddEmailView(viewModel: viewModel )
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: abs(proxy.size.width - 60), height: 44)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.top)
                }

                Spacer()
                HStack{
                    Spacer()
                    Text("Already have an account ?")
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
            .padding()
        .background(Color(.systemGray5))
        }
    }
}

#Preview {
    LoginGenderView(viewModel: RegistrationViewModel() )
}
