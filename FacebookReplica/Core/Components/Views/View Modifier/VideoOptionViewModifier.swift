//
//  VideoOptionViewModifier.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 12/06/2024.
//

import SwiftUI

struct VideoOptionViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(Color(.darkGray))
    }
    
}
extension View{
    func videoOptionViewModifier() -> some View{
        modifier(VideoOptionViewModifier())
      }
}
