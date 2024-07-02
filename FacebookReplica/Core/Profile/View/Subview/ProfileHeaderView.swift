//
//  ProfileHeaderView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 05/06/2024.
//

import SwiftUI


struct ProfileHeaderView: View {
    private var width: CGFloat
    @StateObject private var viewModel = FeedViewModel()
    init(viewModel: FeedViewModel,width: CGFloat) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.width = width
    }
   
    var body: some View {
        
        VStack{
            Image("\(viewModel.users[0].coverImageName ?? "")")
                .resizable()
                .scaledToFill()
                .frame(width: width , height: 250)
            Color.white
                .frame(height: 180)
        }
        .overlay{
            VStack(alignment: .leading) {
                Button(action: {}, label: {
                    Image("\(viewModel.users[0].profileImageName ?? "")")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120 , height: 120)
                        .clipShape(Circle() )
                        .overlay{
                            Circle()
                                .stroke(Color(.systemGray6),lineWidth: 3)
                        }
                        .padding(.top , 170)
                 })

              
                Text("\(viewModel.users[0].firstName ?? "")\(viewModel.users[0].familyName ?? "")")
                    .font(.title)
                    .fontWeight(.bold)
                Text("\(viewModel.friends.count)")
                    .font(.headline) +
                Text("friends")
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
    }
}


#Preview {
    ProfileHeaderView(viewModel: FeedViewModel(), width: 100)
}
