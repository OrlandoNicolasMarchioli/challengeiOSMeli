//
//  Tag.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import Foundation

enum Tag: String, Codable {
    case fulfillment = "fulfillment"
    case mandatoryFreeShipping = "mandatory_free_shipping"
    case selfServiceIn = "self_service_in"
    case selfServiceOut = "self_service_out"
}
