//
//  PDPTracking.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import Foundation

struct PDPTracking: Codable {
    let group: Bool
    let productInfo: [ProductInfo]

    enum CodingKeys: String, CodingKey {
        case group
        case productInfo = "product_info"
    }
}
