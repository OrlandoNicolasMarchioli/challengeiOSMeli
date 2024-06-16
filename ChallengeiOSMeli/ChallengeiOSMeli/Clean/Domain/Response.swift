//
//  Response.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Response: Codable {
    let siteID: String?
    let countryDefaultTimeZone: String?
    let query: String?
    let paging: Paging?
    let results: [Product]
    let sort: Sort?
    let availableSorts: [Sort]?
    let filters: [Filt]?
    let availableFilters: [AvailableFilter]?
    let pdpTracking: PDPTracking?
    let userContext: JSONNull?

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging, results, sort
        case availableSorts = "available_sorts"
        case filters
        case availableFilters = "available_filters"
        case pdpTracking = "pdp_tracking"
        case userContext = "user_context"
    }
}
