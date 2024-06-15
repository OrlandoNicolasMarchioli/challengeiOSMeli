//
//  Response.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Response: Codable {
    let siteId: String
    let countryDefaultTimeZone: String
    let query: String
    let paging: Paging
    let results: [Product]
        
    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging, results
    }
}
