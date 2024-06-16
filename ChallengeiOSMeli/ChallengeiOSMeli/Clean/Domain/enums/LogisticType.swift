//
//  LogisticType.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import Foundation

enum LogisticType: String, Codable {
    case crossDocking = "cross_docking"
    case dropOff = "drop_off"
    case fulfillment = "fulfillment"
    case xdDropOff = "xd_drop_off"
}
