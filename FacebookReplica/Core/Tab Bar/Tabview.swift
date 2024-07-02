//
//  Tabview.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 14/05/2024.
//

import SwiftUI

struct Tabview: View {
    @State private var isTabSelected: Int = 0
    var body: some View {
        TabView {
          FeedView()
                .tabItem {
                    Image(systemName: "house")
                        .environment(\.symbolVariants, isTabSelected == 0 ? .fill : .none  )
                }
                .onAppear{
                    isTabSelected = 0
                }
            VideoView()
                  .tabItem {
                      Image(systemName: "play.tv")
                          .environment(\.symbolVariants, isTabSelected == 1 ? .fill : .none  )
                  }
                  .onAppear{
                      isTabSelected = 1
                  }
            FriendsView()
                  .tabItem {
                     
                      Image(systemName: "person.2")
                          .environment(\.symbolVariants, isTabSelected == 2 ? .fill : .none  )
                  }
                  .onAppear{
                      isTabSelected = 2
                  }
           MarketPlaceView()
                  .tabItem {
                      Image("marketplace")
                          .environment(\.symbolVariants, isTabSelected == 3 ? .fill : .none  )
                  }
                  .onAppear{
                      isTabSelected = 3
                  }
            MenuView()
                  .tabItem {
                      Image(systemName: "text.justify")
                          .environment(\.symbolVariants, isTabSelected == 4 ? .fill : .none  )
                  }
                  .onAppear{
                      isTabSelected = 4
                  }
        }
        .onAppear{
            UITableView.appearance().tintColor = .white
        }
    }
}

#Preview {
    Tabview()
}
