//
//  ProfileView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 02/06/2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = FeedViewModel()
    init(viewModel: FeedViewModel, isVideo: Bool) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        //self.isVideo = isVideo
    }
   
    var body: some View {
        GeometryReader { proxy in
            ScrollView{
                VStack{
                    ProfileHeaderView(viewModel: viewModel, width: proxy.size.width)
                    DividerView(width: proxy.size.width)
                    ProfileOptionsView()
                    ProfileFriendsView(viewModel: viewModel, width: proxy.size.width)
                    DividerView(width: proxy.size.width)
                    ManagePostView(width: proxy.size.width)
                    ForEach (0 ..< viewModel.myPostIndexes.count) { index  in
                        PostView(viewModel: viewModel,  index: viewModel.myPostIndexes[index], isVideo: false)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("\(viewModel.currentUser?.firstName ?? "" ) \(viewModel.currentUser?.familyName ?? "")")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                                .fontWeight(.bold)
                     })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.black)
                                .fontWeight(.bold)
                     })
                }
        }
        }
    }
}

#Preview {
    ProfileView(viewModel: FeedViewModel(), isVideo: false)
}




