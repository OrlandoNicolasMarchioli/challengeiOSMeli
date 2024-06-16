//
//  FilterValue.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import Foundation

struct FilterValue: Codable {
    let id, name: String?
    let pathFromRoot: [Sort]??

    enum CodingKeys: String, CodingKey {
        case id, name
        case pathFromRoot = "path_from_root"
    }
}
