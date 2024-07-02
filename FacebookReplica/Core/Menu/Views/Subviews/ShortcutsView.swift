//
//  ShortcutsView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 11/06/2024.
//

import SwiftUI


struct ShortcutsView: View {
    private var gridItems:[GridItem] = [
        .init(.flexible(),spacing: 15),
        .init(.flexible(),spacing: 15),
    ]
    private var shorcutsArray: [(String,String)] = [
    ("Memories","gobackward"),
    ("Saved","bookmark.fill"),
    ("Groups","person.2.circle"),
    ("Video","play.tv.fill"),
    ("Marketplace","storefront.fill"),
    ("Friends","person.2.fill"),
    ("Feeds","calendar.badge.clock"),
    ("Events","calendar"),
    ]
    init(width: CGFloat) {
        self.width = width
    }
    private var width: CGFloat
    var body: some View {
        VStack(alignment: .leading){
            Text("Your Shortcuts")
                .font(.headline)
                .foregroundStyle(Color(.darkGray))
            LazyVGrid(columns: gridItems, spacing: 15){
                ForEach(0 ..< 8){ value in
                    VStack(alignment: .leading, spacing: 12){
                        Button(action: {}, label: {
                            Image(systemName: shorcutsArray[value].1)
                                .foregroundStyle(.blue)
                        })
                        Button(action: {}, label: {
                            Text( shorcutsArray[value].0)
                                .font(.headline)
                                .foregroundStyle(.black)
                        })
                            HStack{Spacer()}
                      
                        
                    }
                    .padding(.horizontal)
                    .frame(width: width * 0.45 ,height: 80)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
            }
            Button(action: {}, label: {
                Text("See More")
                    .customeViewModifier(width: width)
                
            })
        }
        .padding(.horizontal)
    }
}


#Preview {
    ShortcutsView(width: 400)
}
