//
//  MyStoryCard.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 05/06/2024.
//

import SwiftUI


struct MyStoryCardView: View {
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius:15)
                .foregroundStyle(Color(.systemGray6))
                .frame(width: 100, height :170)
            Image("profilePic1")
                .resizable()
                .scaledToFill()
                .frame(width: 100,height: 110)
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, topTrailing: 15)))
            VStack(spacing: 5){
                Spacer()
                    .frame(height :90)
                Image(systemName: "plus")
                    .padding(5)
                    .background(.blue)
                    .clipShape(Circle())
                    .foregroundStyle(.white)
                    .font(.system(size:20 , weight:.bold))
                    .overlay{
                        Circle()
                            .stroke(Color(.systemGray6),lineWidth: 3)
                    }
                VStack(spacing: 5){
                    Text("Create")
                    Text("Story")
                }
                .font(.system(size:12 , weight:.bold))
            }
        }
    }
}

#Preview {
    MyStoryCardView()
}
