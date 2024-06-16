//
//  Shipping.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Shipping: Codable {
    let storePickUp, freeShipping: Bool
    let logisticType: LogisticType
    let mode: String
    let tags: [Tag]
    let benefits, promise: JSONNull?
    let shippingScore: Int

    enum CodingKeys: String, CodingKey {
        case storePickUp = "store_pick_up"
        case freeShipping = "free_shipping"
        case logisticType = "logistic_type"
        case mode, tags, benefits, promise
        case shippingScore = "shipping_score"
    }
}
