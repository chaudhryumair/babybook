//
//  File.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 27/06/2024.
//

import Foundation
import Firebase

struct Item: Identifiable,Hashable,Codable {
    
    let id: String
    var item_name: String
    var item_price: Int
    var imageName: String
        
}
