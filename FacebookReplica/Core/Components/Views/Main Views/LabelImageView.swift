//
//  LabelImageView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 06/06/2024.
//

import SwiftUI

struct LabelImageView : View {
    private var imageName:String
    private var title:String
 
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    var body: some View {
        HStack(spacing: 10){
            Button(action: {}, label: {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.red)
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.darkGray))
             })
           
            
        }
        .padding(.horizontal,25)
        .padding(.vertical,5)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius:30))
    }
}

#Preview {
    LabelImageView(imageName: "play.rectangle.fill", title: "Add Story")
}
