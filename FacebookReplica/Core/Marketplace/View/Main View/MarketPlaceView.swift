//
//  MarketPlaceView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 11/06/2024.
//

import SwiftUI

struct MarketPlaceView: View {
    private var viewModel = MarketPlaceViewModel()
    private var gridItems:[GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
    ]
    var body: some View {
        NavigationStack{
            GeometryReader { proxy in
                ScrollView {
                    HStack {
                        MarketPlaceButton(title: "Sell", imageName: "square.and.pencil", width: proxy.size.width)
                        MarketPlaceButton(title: "Categories", imageName: "list.bullet", width: proxy.size.width)
                    }
                    .padding()
                    Divider()
                    VStack(alignment:.leading){
                        HStack{
                            Text("Today`s Pick")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Spacer()
                            Image("pin")
                                .resizable()
                                .frame(width: 20,height: 16)
                            Text("London")
                                .font(.subheadline)
                                .foregroundStyle(.blue)
                        }
                        .padding()
                        LazyVGrid(columns: gridItems, spacing: 1){
                            ForEach(viewModel.items){ item in
                                VStack{
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (proxy.size.width / 2) - 3 ,height: (proxy.size.width / 2) - 3 )
                                        .clipped()
                                    Text("\(item.item_price)$ \(item.imageName)")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                        .padding(.vertical)
                                }
                            }
                        }
                        
                    }
                }
                .scrollIndicators(.hidden)
                .scrollBounceBehavior(.basedOnSize)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("MarketPlace")
                            .font(.system(size: 32 , weight: .bold))
                            .foregroundStyle(AppColors.FBBlueColor)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing:24) {
                            Button(action: {}, label: {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24,height: 24)
                                    .foregroundStyle(.black)
                             })
                            
                            Button(action: {}, label: {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24,height: 24)
                                    .font(.system(size: 18,weight: .bold))
                                    .foregroundStyle(.black)
                             })
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MarketPlaceView()
}
