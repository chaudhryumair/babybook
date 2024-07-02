//
//  ChoiceView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 10/06/2024.
//

import SwiftUI


struct ChoiceView: View {
    private var imageName:String
    private var title:String
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    var body: some View {
        HStack{
            HStack(spacing: 12 ){
                Image(systemName:imageName)
                    .frame(width: 14, height: 15)
                Text(title)
                Text("♥︎")
                    .font(.caption2)
            }
            .font(.subheadline)
            .foregroundStyle(.blue)
            .padding(.horizontal)
            .fontWeight(.bold)
            .padding(.vertical,5)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius:8))
            
        }
    }
}


#Preview {
    ChoiceView(imageName: "person.2.fill", title: "Freinds")
}
