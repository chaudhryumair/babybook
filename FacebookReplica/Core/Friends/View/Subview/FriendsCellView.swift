//
//  FriendsCellView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 10/06/2024.
//

import SwiftUI
import Kingfisher


struct FriendsCellView: View {
    private var viewModel = FriendsViewModel()
    private var index: Int
    init(viewModel: FriendsViewModel = FriendsViewModel(), index: Int) {
        self.viewModel = viewModel
        self.index = index
    }

    var body: some View {
        HStack{
            ZStack{
                Image("no_profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70,height: 70)
                    .clipShape(Circle())
                KFImage(URL(string: viewModel.friendsRequest[index].profileImageName ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70,height: 70)
                    .clipShape(Circle())
            }
           
            VStack(alignment: .leading){
                Text("\(viewModel.friendsRequest[index].firstName)\(viewModel.friendsRequest[index].familyName)")
                    .font(.headline)
                    .fontWeight(.semibold)
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Text("Confirm")
                            .foregroundStyle(.white)
                            .frame(width: 120,height: 32)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius:8))
                        
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Delete")
                            .foregroundStyle(.black)
                            .frame(width: 120,height: 32)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius:8))
                        
                    })
                }
                
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    FriendsCellView(index: 0)
}
