//
//  Attribute.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Attr: Codable {
    let id: String
    let name: String
    let value_id: String?
    let value_name: String
    let attribute_group_id: String
    let attribute_group_name: String
    let value_struct: ValueStruct?
    let values: [AttributeValue]
    let source: Int
    let value_type: String
    
}
