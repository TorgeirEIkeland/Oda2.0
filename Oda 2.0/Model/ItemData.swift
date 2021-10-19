//
//  ItemData.swift
//  Oda 2.0
//
//  Created by Torgeir Eikeland on 15/10/2021.
//

import Foundation

struct ItemData: Codable {
    let items: [Item]
}
struct Item: Codable {
    let product: Product
}
struct Product: Codable, Hashable {
    let name: String
    let name_extra: String
    let images: [ItemImage]

    let gross_price: String
    let gross_unit_price, unit_price_quantity_abbreviation: String
    var itemCount: Int? = 0
    
}

struct ItemImage: Codable, Hashable {
    let thumbnail, large: Large
}

struct Large: Codable, Hashable {
    let url: String
}

