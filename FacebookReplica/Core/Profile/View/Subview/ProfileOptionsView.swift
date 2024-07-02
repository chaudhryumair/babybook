//
//  ProfileOptionsView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 06/06/2024.
//

import SwiftUI


struct ProfileOptionsView: View {
   
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack(spacing: 24){
                Button(action: {}, label: {
                    Text("Posts")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .padding(.horizontal)
                        .padding(.vertical,7)
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                 })
                Button(action: {}, label: {
                    Text("Photos")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.darkGray))
                 })
                Button(action: {}, label: {
                    Text("Reels")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.darkGray))
                 })
            }
            .padding(.horizontal )
            Divider()
            
        }
    }
}



#Preview {
    ProfileOptionsView()
}
