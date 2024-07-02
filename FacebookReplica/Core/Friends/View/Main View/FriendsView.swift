//
//  FriendsView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 10/06/2024.
//

import SwiftUI

struct FriendsView: View {
    private var viewModel = FriendsViewModel()

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    HStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            TagView(title: "Suggestions")
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                           
                            TagView(title: "Your Friends")
                            Spacer()
                        })
                    }
                    .padding(.horizontal)
                    Divider()
                    HStack{
                        Text("Freind Requests")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("\(viewModel.friendsRequest.count ?? 0)")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("See All")
                        })
                    }
                    .padding(.horizontal)
                    ForEach(0 ..< viewModel.friendsRequest.count){ index in
                        FriendsCellView(viewModel: viewModel, index: index)
                    }
                    Spacer()
                }
                .padding(.vertical )
                    
                
            }
            .scrollIndicators(.hidden)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                     Text("Freinds")
                        .font(.title)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .topBarTrailing) {
                     Image(systemName:"magnifyingglass")
                        .fontWeight(.bold)
                }

            }
        }
    }
}

#Preview {
    FriendsView()
}
