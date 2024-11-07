//
//  HeaderView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 02/06/2024.
//

import SwiftUI
import Kingfisher


struct HeaderView: View {
    @StateObject private var viewModel = FeedViewModel()
    @State private var showCreatePost: Bool = false
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        HStack{
            NavigationLink{
                ProfileView(viewModel: viewModel, isVideo: false)
                    .navigationBarBackButtonHidden(true)
            }
        label:{
            ZStack{
                Image("no_profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                KFImage(URL(string:viewModel.currentUser?.profileImageName ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
           
        }
            Button(action: {
                showCreatePost.toggle()
            }, label: {
                HStack{
                    Text("What`s on your mind")
                        .foregroundStyle(.black )
                        .fontWeight(.medium)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical , 10)
                .overlay{
                    Capsule()
                        .stroke(Color(.systemGray4),lineWidth: 1)
                }
                .padding(.leading , 5)
                .padding(.trailing , 10)
            })
            Button(action: {}, label: {
                
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20,height: 20)
                    .foregroundColor(.green)
            })
            
            
           
        }
        .padding(.horizontal)
        .padding(.top , 30)   
        .padding(.bottom)
        .fullScreenCover(isPresented: $showCreatePost, content: {
            CreatePostView()
        })

    }
}


#Preview {
    HeaderView(viewModel: FeedViewModel())
}
