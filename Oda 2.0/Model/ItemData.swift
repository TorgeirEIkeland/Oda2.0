//
//  ItemData.swift
//  Oda 2.0
//
//  Created by Torgeir Eikeland on 15/10/2021.
//

import Foundation
import SwiftUI

struct ItemData: Codable {
    let items: [OdaProducts]
}

struct OdaProducts: Codable {
    let product: Product
}

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let nameExtra: String
    let grossPrice: String
    let grossUnitPrice: String
    let unitPriceQuantityAbbreviation: String
    let unitPriceQuantityName: String
    let images: [ItemImage]
    let discount: Discount?
    let availability: Availability
}

struct ItemImage: Codable {
    let thumbnail, large: Large
}

struct Large: Codable {
    let url: String
}

struct Discount: Codable {
    let isDiscounted: Bool
    let undiscountedGrossPrice: String
    let undiscountedGrossUnitPrice: String
    let descriptionShort: String
}

struct Availability: Codable {
    let isAvailable: Bool
    let code: String
    let description: String
    let descriptionShort: String
}

