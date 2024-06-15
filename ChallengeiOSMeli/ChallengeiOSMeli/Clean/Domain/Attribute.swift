//
//  Attribute.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Attribute: Codable {
    let id: String
    let name: String
    let valueId: String?
    let valueName: String
    let attributeGroupId: String
    let attributeGroupName: String
    let valueStruct: ValueStruct?
    let values: [Val]
    let source: Int
    let valueType: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case valueId = "value_id"
        case valueName = "value_name"
        case attributeGroupId = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
        case valueStruct = "value_struct"
        case values, source
        case valueType = "value_type"
    }
}
