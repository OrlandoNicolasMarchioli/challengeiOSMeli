//
//  AvailableFilter.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import Foundation

struct AvailableFilter: Codable {
    let id, name: String
    let type: TypeEnum
    let values: [AvailableFilterValue]
}
