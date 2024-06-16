//
//  VariationsDatumAttribute.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import Foundation

struct VariationsDataAttribute: Codable {
    let id: String?
    let name: String?
    let valueName: Val?
    let valueType: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueName = "value_name"
        case valueType = "value_type"
    }
}
