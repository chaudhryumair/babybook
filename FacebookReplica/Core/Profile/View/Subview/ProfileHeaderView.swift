//
//  ProfileHeaderView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 05/06/2024.
//

import SwiftUI
import PhotosUI
import Kingfisher


struct ProfileHeaderView: View {
    private var width: CGFloat
    @StateObject private var viewModel = FeedViewModel()
    @State private var showProfileImagePicker: Bool = false
    @State private var showCoverImagePicker: Bool = false

    init(viewModel: FeedViewModel,width: CGFloat) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.width = width
       
    }
   
    var body: some View {
        
        VStack{
            Button {
                showCoverImagePicker.toggle()
            } label: {
                ZStack{
                    Image("no_profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width , height: 250)
                    KFImage(URL(string: viewModel.currentUser?.coverImageName ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width , height: 250)
                }
               
                    
            }

           
            Color.white
                .frame(height: 180)
        }
        .overlay{
            VStack(alignment: .leading) {
                Button(action: {
                    showProfileImagePicker.toggle()
                }, label: {
                    ZStack{
                        Image("no_profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120 , height: 120)
                            .clipShape(Circle() )
                            .overlay{
                                Circle()
                                    .stroke(Color(.systemGray6),lineWidth: 3)
                            }
                            .padding(.top , 170)
                        KFImage(URL(string: viewModel.currentUser?.profileImageName ?? ""))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120 , height: 120)
                            .clipShape(Circle() )
                            .overlay{
                                Circle()
                                    .stroke(Color(.systemGray6),lineWidth: 3)
                            }
                            .padding(.top , 170)
                    }
                      
                 })
                .padding(.top)

             
                Text("\(viewModel.currentUser?.firstName ?? "") \(viewModel.currentUser?.familyName ?? "")")
                    .font(.title)
                    .fontWeight(.bold)
                Text("\(viewModel.friends.count)")
                    .font(.headline) +
                Text(" Friends")
                    .font(.headline)
                    .foregroundStyle(.gray)
                HStack{
                    CustomButton(imageName: "plus", title: "Add Story", backgroundColor: Color.blue , foregroundColor: .white)
                    CustomButton(imageName: "pencil", title: "Edit Profile", backgroundColor: Color(.systemGray5) , foregroundColor: Color(.darkGray))
                    CustomButton(imageName: "ellipsis", title: "", backgroundColor: Color(.systemGray5) , foregroundColor: Color(.darkGray))
                }
                
                HStack{Spacer()}
            }
            .padding(.horizontal)
        }
        .photosPicker(isPresented: $showProfileImagePicker, selection:  $viewModel.selectedImage)
        .photosPicker(isPresented: $showCoverImagePicker, selection:  $viewModel.selectedCoverImage)
        
    }
}


#Preview {
    ProfileHeaderView(viewModel: FeedViewModel(), width: 100)
}
