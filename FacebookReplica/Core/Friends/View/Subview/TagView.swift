//
//  TagView.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 10/06/2024.
//

import SwiftUI

struct TagView: View {
    private var title: String
    init(title: String) {
        self.title = title
    }
    var body: some View {
        Text(title)
            .font(.headline)
            .padding(.horizontal)
            .padding(.vertical,8)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
#Preview {
    TagView(title: "Suggestions")
}
