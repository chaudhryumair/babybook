//
//  ProfileFriendsView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 06/06/2024.
//

import SwiftUI
import Kingfisher

struct ProfileFriendsView: View {
    private var gridItems:[GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
    ]
    private let width:CGFloat
    @StateObject private var viewModel = FeedViewModel()
    init(viewModel: FeedViewModel,width: CGFloat) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.width = width
    }
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("Friends")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("\(viewModel.friends.count) Friends")
                        .font(.subheadline)
                        .foregroundStyle(Color(.systemGray))
                }
                Spacer()
                Button(action: {}, label: {
                    Text("Find  Friends")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                 })
            }
            LazyVGrid(columns: gridItems){
                ForEach (viewModel.friends){friend in
                    VStack{
                        ZStack{
                            Image("no_profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: (width / 3 - 20), height: width / 3 - 20)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            KFImage(URL(string: friend.profileImageName ?? "" ))
                                .resizable()
                                .scaledToFill()
                                .frame(width: (width / 3 - 20), height: width / 3 - 20)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                       
                        Text("\(friend.firstName ?? "") \(friend.familyName)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }
            Button(action: {}, label: {
                Text("See all friends")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: width - 30, height: 44)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.vertical)
                    .foregroundStyle(Color(.darkGray))
                
             })
        }
        .padding(.horizontal)
    }
}


#Preview {
    ProfileFriendsView(viewModel: FeedViewModel(), width: 400)
}
