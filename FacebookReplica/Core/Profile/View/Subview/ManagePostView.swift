//
//  ManagePostView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 06/06/2024.
//

import SwiftUI


struct ManagePostView: View {
    private var width: CGFloat  
    @StateObject private var viewModel = FeedViewModel()

    init(width: CGFloat) {
        self.width = width
    }
    var body: some View {
        VStack{
            HStack{
                Text("posts")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Text("Filter")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            }
            .padding(.horizontal)
            HStack(spacing: 16){
                HeaderView(viewModel: viewModel)
            }
            .padding(.vertical, -5)
            Color(.systemGray6)
                .frame(height: 70)
                .overlay{
                    HStack{
                        LabelImageView(imageName: "play.rectangle.fill", title: "Add Story")
                        LabelImageView(imageName: "video.fill", title: "Live")
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            Button(action: {}, label: {
                HStack(spacing: 16){
                    Image(systemName: "text.bubble.fill")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("Manage posts")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                }
                .frame(width:width - 30 , height: 44 )
                .foregroundStyle(Color(.darkGray))
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.vertical)
            })
            DividerView(width: width)
        }
    }
}


#Preview {
    ManagePostView(width: 400)
}
