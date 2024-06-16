//
//  Installments.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Installments: Codable {
    let quantity: Int
    let amount, rate: Double
    let currencyID: CurrencyID

    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID = "currency_id"
    }
}
