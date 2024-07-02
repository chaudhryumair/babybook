//
//  MenuHeaderView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 11/06/2024.
//

import SwiftUI


struct MenuHeaderView: View {
  
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Image("profilePic1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
                Text("Aatir Chauhdry")
                Spacer()
                Button(action: {}, label: {
                    Image(systemName:"chevron.down.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24,height: 24)
                        .foregroundStyle(Color(.systemGray3))
                 })
               
            }
            Divider()
            HStack(spacing: 15){
                Button(action: {}, label: {
                    Image(systemName:"plus.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30,height: 30)
                    Text("Create another profile")
                    Spacer()
                 })
               
            }
            .foregroundStyle(Color(.darkGray))
            
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    MenuHeaderView()
}
