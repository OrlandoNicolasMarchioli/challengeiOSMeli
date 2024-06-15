//
//  Val.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Val: Codable {
    let id: String?
    let name: String
    let str: ValueStruct?
    let source: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case str = "struct"
        case source
    }
}
