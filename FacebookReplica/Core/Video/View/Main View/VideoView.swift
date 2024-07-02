//
//  VideoView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 12/06/2024.
//

import SwiftUI

struct VideoView: View {
    @StateObject private var viewModel = FeedViewModel()

    var body: some View {
        NavigationView{
            GeometryReader { proxy in
                ScrollView {
                    VideoOptionView()
                             ForEach (0 ..< 2) { _ in
                                 PostView(viewModel: viewModel, index: 0, isVideo: true)
                             }
                }
                .background(Color(.systemGray6))
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Video")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing:24) {
                            Button(action: {}, label: {
                                Image(systemName: "person.fill")
                             })
                            
                            Button(action: {}, label: {
                                Image(systemName: "magnifyingglass")
                             })
                        }
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    }
                }
            }
        }
    }
    
}

#Preview {
    VideoView()
}


   
