//
//  Paging.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Paging: Codable {
    let total: Int
    let primaryResults: Int
    let offset: Int
    let limit: Int
    
    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}
