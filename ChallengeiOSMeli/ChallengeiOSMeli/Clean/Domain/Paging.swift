//
//  Paging.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Paging: Codable {
    let total, primaryResults, offset, limit: Int?

        enum CodingKeys: String, CodingKey {
            case total
            case primaryResults = "primary_results"
            case offset, limit
        }
    
}
