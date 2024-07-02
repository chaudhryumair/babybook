//
//  VideoOptionView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 12/06/2024.
//

import SwiftUI

struct VideoOptionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24){
            ScrollView(.horizontal) {
                HStack(spacing: 24){
                    Button(action: {}) {
                        Text("For you")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                            .padding(.horizontal)
                            .padding(.vertical,7)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    Button(action: {}) {
                        Text("Live")
                            .videoOptionViewModifier()
                    }
                    Button(action: {}) {
                        Text("Gaming")
                            .videoOptionViewModifier()
                    }
                    
                    Button(action: {}) {
                        Text("Reels")
                            .videoOptionViewModifier()
                    }
                    Button(action: {}) {
                        Text("Following")
                            .videoOptionViewModifier()
                    }
                    
                    
                }
            }
            .padding(.leading)
            .padding(.trailing)
            
            Divider()
        }
        .padding(.vertical)
    }
}


#Preview {
    VideoOptionView()
}
