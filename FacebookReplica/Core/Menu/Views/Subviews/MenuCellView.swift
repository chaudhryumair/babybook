//
//  MenuCellView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 12/06/2024.
//

import SwiftUI


struct MenuCellView: View {
    private var imageName:String
    private var title:String
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    var body: some View {
        VStack(alignment: .leading){
            Divider()
            HStack(spacing: 15){
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24,height: 24)
                    .foregroundStyle(.gray)
                Text(title)
                
                Spacer()
                Image(systemName:"chevron.down")
                
            }
            .padding(.horizontal)
            .padding(.vertical, 7)
            //.font(.headline)
            
        }
    }
}


#Preview {
    MenuCellView(imageName: "questionmark.circle.fill", title: "Help & Support")}
