//
//  PostView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 05/06/2024.
//

import SwiftUI
import AVKit



struct PostView: View {
    // MARK: - Variables
    private var FBColor:Color = Color(red: 26/255, green: 103/255, blue: 178/255)
    
    @StateObject private var viewModel = FeedViewModel()
    @State private var index: Int
    @State private var likeValue = 0
    @State private var commentValue = 0
    @State private var shareValue = 0
    private var isVideo : Bool
    @State private var player = AVPlayer()
    

    // MARK: - Initializer
    
    init(viewModel: FeedViewModel, index: Int, isVideo: Bool) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
        self.isVideo = isVideo

    }
   
    
    // MARK: - Body
    var body: some View {
        VStack(alignment:.leading){
            HStack {
                Image("\(viewModel.posts[index].users?.profileImageName ?? "")")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 0){
                    Text("\(viewModel.posts[index].users?.firstName ?? "")\(viewModel.posts[index].users?.familyName ?? "")")
                        .foregroundStyle(.black )
                        .font(.system(size: 14 , weight: .semibold))
                    
                    HStack(spacing: 5) {
                        Text("1 d")
                        Circle()
                            .frame(width: 2,height: 2)
                        Image(systemName: "globe")
                    }
                    .font(.system(size: 12))
                    .foregroundStyle(FBColor)
                }
                Spacer()
                HStack(spacing: 24) {
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                     })
                    Button(action: {}, label: {
                        Image(systemName: "xmark")
                     })
                }
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.bold)
            }
            .padding(.horizontal)
           
            Text("\(viewModel.posts[index].postTitle)")
                .padding(.horizontal)
            if !isVideo{
                Image("\(viewModel.posts[index].postUrl)")
                    .resizable()
                    .scaledToFit()
            }else{
                VideoPlayer(player: player)
                    
                    .onAppear{
                      if player.currentItem == nil {
                            let item = AVPlayerItem(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
                            player.replaceCurrentItem(with: item)
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: {
                            player.play()
                        })
                    }
                   
                    .onDisappear {
                        player.pause()
                    }
                    
                    .frame(height: 400)
                
                }
            
           
            HStack(spacing: 3){
                Image("like")
                    .resizable()
                    .frame(width: 18,height: 18)
                Text("\(viewModel.posts[index].postLikes)")
                
                Spacer()
                Text("\(commentValue) comments")
                Text("•")
                    .fontWeight(.bold)
                Text("\(viewModel.posts[index].postShares) shares")
            }
            .font(.system(size: 12))
            .padding(.horizontal)
            .foregroundStyle(FBColor )
            Divider()
                .background(.white.opacity(0.5))
            HStack{
                
                Spacer()
                HStack{
                    Button(action: {
                        likeValue += 1
                    }, label: {
                        Image(systemName: "hand.thumbsup")
                        Text("Like")
                     })
                }
                Spacer()
                HStack{
                    Button(action: {
                        commentValue += 1
                    }, label: {
                        Image(systemName: "message")
                        Text("Comment")
                     })
                   
                }
                Spacer()
                HStack{
                    Button(action: {
                      
                    }, label: {
                        Image("icone-messager-noir")
                            .resizable()
                            .frame(width:20 , height:20)
                        Text("send")
                     })
                   
                }
                Spacer()
                HStack{
                    Button(action: {
                        shareValue += 1
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.right")
                        Text("share")
                     })
                    
                }
                Spacer()
            }
            .font(.system(size: 12))
            .foregroundStyle(FBColor)
            
        }
    }
}

#Preview {
    PostView(viewModel: FeedViewModel(), index: 0, isVideo: false)
}


