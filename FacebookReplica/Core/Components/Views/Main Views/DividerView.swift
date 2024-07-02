//
//  DividerView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 05/06/2024.
//

import SwiftUI

struct DividerView: View {
    private var width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    var body: some View {
        Rectangle()
            .foregroundStyle(Color(.systemGray4))
            .frame(width: width,height: 6)
    }
}
