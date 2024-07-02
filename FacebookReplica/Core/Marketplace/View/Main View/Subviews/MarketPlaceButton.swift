//
//  MarketPlaceButton.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 11/06/2024.
//

import SwiftUI

struct MarketPlaceButton: View {
    private var title:String
    private var imageName:String
    private var width:CGFloat
    init(title: String, imageName: String, width: CGFloat) {
        self.title = title
        self.imageName = imageName
        self.width = width
    }

    var body: some View {
        HStack{
            Button(action: {}, label: {
                Image(systemName: imageName)
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
            })
            .frame(width: width * 0.45,height: 44)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            }
        .foregroundStyle(.black)
    }
}

#Preview {
    MarketPlaceButton(title: "Sell", imageName: "square.and.pencil", width: 400)}
