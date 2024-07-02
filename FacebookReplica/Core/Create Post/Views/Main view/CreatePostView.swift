//
//  CreatePostView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 09/06/2024.
//

import SwiftUI

struct CreatePostView: View {
    // MARK: - Variables

    @Environment(\.dismiss) private var dismiss
    @State private var mindText: String = ""
    // MARK: - Body View

    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                Divider()
                HStack(alignment: .top){
                    Image("profilePic1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                         Text("Aatir Chaudhry")
                        HStack{
                            ChoiceView(imageName: "person.2.fill", title: "Friends")
                            ChoiceView(imageName: "", title: "Album")
                        }
                        ChoiceView(imageName: "camera", title: "Off")
                    }
                    .padding(.horizontal)
                }
                .padding()
                TextField("What`s on your mind?", text: $mindText, axis: .vertical)
                    .padding(.horizontal)
                Spacer()
                Divider()
                HStack{
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "photo.fill.on.rectangle.fill")
                            .foregroundStyle(.green)
                    })
                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "person.fill")
                            .foregroundStyle(.blue)
                    })
                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "face.smiling")
                            .foregroundStyle(.yellow)
                    })
                    Spacer()

                    Button(action: {}, label: {
                        Image( "pin")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 18, height: 18)

                    })
                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "ellipsis.rectangle.fill")
                            .foregroundStyle(Color(.darkGray))
                    })
                    Spacer()

                    
                }
                .padding(.horizontal)
            }
            .toolbar {
                leadingItems()
               trailingItems()
             
        }
        }
       
    }}
// MARK: - Create Toolbar
extension CreatePostView{
    @ToolbarContentBuilder
    private func trailingItems() -> some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing) {
            HStack{
                createPostButton()
        }
    }
    }
    
    @ToolbarContentBuilder
    private func leadingItems() -> some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            HStack{
            Button(action: {
                dismiss()
            }, label: {
            Image(systemName: "arrow.left")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
            })
        Text("Create Post")
        }}
    }
    private func createPostButton() -> some View{
        Button(action: {}, label: {
            Text("Post")
                .font(.subheadline)
                .fontWeight(.bold)
                .frame(width: 80, height: 30)
                .foregroundStyle(mindText.count == 0 ? Color(.darkGray) : .white)
                .background(mindText.count == 0 ? Color(.systemGray5) : .blue)
                .clipShape(RoundedRectangle(cornerRadius:  8 ))

        })
        .disabled(mindText.count == 0)
    }
}


#Preview {
    CreatePostView()
    
   
}
