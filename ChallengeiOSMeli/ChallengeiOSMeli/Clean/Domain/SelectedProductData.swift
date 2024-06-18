//
//  SelectedProduct.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct SelectedProductData: Identifiable{
    let id: String
    let imageUrl: String
    let productName: String
    let freeShipment: Bool
    let productPrice: Double
    let productOriginalPrice: Double
    let availableQuantity: Int
    let attributeNames: [String]
    let sellerName: String
}
