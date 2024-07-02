//
//  CustomTextfieldViewModifier.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 21/06/2024.
//

import SwiftUI
struct CustomTextfieldViewModifier: ViewModifier {
    private var width:CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.white)
            .frame(width: width - 30, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}
extension View{
    func customTextfieldViewModifier(width: CGFloat) -> some View{
        modifier(CustomTextfieldViewModifier(width: width))
    }
}

