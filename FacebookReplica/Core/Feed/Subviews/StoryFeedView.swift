//
//  StoryFeedView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 05/06/2024.
//

import SwiftUI

struct StoryFeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                MyStoryCardView()
                ForEach (0 ..< viewModel.friends.count) { index in

                    StoryCardView(viewModel: viewModel, index: index)
                }
            }
            .padding(.leading)
        }
        .scrollIndicators(.hidden)
        .padding(.vertical, 5)
    }
}


#Preview {
    StoryFeedView(viewModel: FeedViewModel())
}
