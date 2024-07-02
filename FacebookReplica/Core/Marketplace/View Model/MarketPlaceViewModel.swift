//
//  MarketPlaceViewModel.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 27/06/2024.
//

import Foundation
import Observation

@Observable
class MarketPlaceViewModel{
    var items: [Item] = [
        .init(id: UUID().uuidString, item_name: " 1 bed 1 bathroom", item_price: 950, imageName: "apartment1"),
        .init(id: UUID().uuidString, item_name: " 1 bed 1 flat", item_price: 800, imageName: "apartment2"),
        .init(id: UUID().uuidString, item_name: " 1 bed 1 bathroom", item_price: 950, imageName: "car1"),
        .init(id: UUID().uuidString, item_name: " 1 bed 1 flat", item_price: 300, imageName: "car2"),
        .init(id: UUID().uuidString, item_name: " 1 bed 1 bathroom", item_price: 250, imageName: "sofa1"),
        .init(id: UUID().uuidString, item_name: " 1 bed 1 flat", item_price: 100, imageName: "sofa2"),
        .init(id: UUID().uuidString, item_name: " 1 bed 1 flat", item_price: 100, imageName: "sofa2"),
        .init(id: UUID().uuidString, item_name: " 1 bed 1 flat", item_price: 100, imageName: "sofa2"),

        ]
}
