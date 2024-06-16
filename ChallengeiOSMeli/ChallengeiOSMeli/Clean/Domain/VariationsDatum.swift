//
//  VariationsDatum.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import Foundation

struct VariationsDatum: Codable {
    let thumbnail: String
    let ratio, name: String
    let picturesQty: Int
    let price: Double
    let inventoryID: String?
    let userProductID: String
    let attributes: [VariationsDatumAttribute]

    enum CodingKeys: String, CodingKey {
        case thumbnail, ratio, name
        case picturesQty = "pictures_qty"
        case price
        case inventoryID = "inventory_id"
        case userProductID = "user_product_id"
        case attributes
    }
}
