//
//  Installments.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Installments: Codable {
    let quantity: Int
    let amount: Double
    let rate: Int
    let currencyId: String
    
    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyId = "currency_id"
    }
}
