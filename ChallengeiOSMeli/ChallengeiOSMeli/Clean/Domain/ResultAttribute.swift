//
//  ResultAttribute.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import Foundation

struct ResultAttribute: Codable {
    let id: String
    let name: String
    let valueID: String?
    let valueName: String
    let attributeGroupID: String
    let attributeGroupName: String
    let valueStruct: Struct?
    let values: [AttributeValue]
    let source: Int
    let valueType: Val

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case attributeGroupID = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
        case valueStruct = "value_struct"
        case values, source
        case valueType = "value_type"
    }
}
