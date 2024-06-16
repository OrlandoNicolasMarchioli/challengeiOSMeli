//
//  Val.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct AttributeValue: Codable {
    let id: String?
    let name: String?
    let valueStruct: Struct?
    let source: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueStruct = "struct"
        case source
    }
}
