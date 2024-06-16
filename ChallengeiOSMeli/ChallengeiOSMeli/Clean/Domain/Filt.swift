//
//  Filt.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import Foundation

struct Filt: Codable {
    let id, name: String?
    let type: String?
    let values: [FilterValue]?
}
