//
//  FeedView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 02/06/2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    init(viewModel: FeedViewModel = FeedViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationStack{
            GeometryReader { proxy in
                ScrollView {
                    VStack{
                        HeaderView(viewModel: viewModel)
                        DividerView(width: proxy.size.width)
                        StoryFeedView(viewModel: viewModel)
                        DividerView(width: proxy.size.width)
                        ForEach (0 ..< viewModel.posts.count) { index in
                            PostView(viewModel: viewModel, index: index, isVideo: false)
                            DividerView(width: proxy.size.width - 15 )
                        }
                        Spacer()
                    }.toolbar {
                        leadingItems()
                        trailingItems()
                }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}
extension FeedView{
    @ToolbarContentBuilder
    private func trailingItems() -> some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing:24) {
               createFacebookButton()
               createMessengerButton()
               createSearchButton()
            }
        }
    }
    
    @ToolbarContentBuilder
    private func leadingItems() -> some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Text("BabyBook")
                .font(.system(size: 32 , weight: .bold))
                .foregroundStyle(AppColors.FBBlueColor)
        }
    }
    private func createFacebookButton() -> some View{
        Button(action: {}, label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 24,height: 24)
                .foregroundStyle(.black)
         })
    }
    private func createMessengerButton() -> some View{
        Button(action: {}, label: {
            Image("messenger")
                .resizable()
                .scaledToFit()
                .frame(width: 24,height: 24)
                .foregroundStyle(.black)
         })
    }
    private func createSearchButton() -> some View{
        Button(action: {}, label: {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 24,height: 24)
                .font(.system(size: 18,weight: .bold))
                .foregroundStyle(.black)
         })

    }

}


#Preview {
    FeedView(viewModel: FeedViewModel())
}
