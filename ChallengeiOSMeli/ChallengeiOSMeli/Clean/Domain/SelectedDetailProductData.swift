//
//  SelectedDetailProductData.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 16/06/2024.
//

import Foundation

struct SelectedDetailProductData{
    let imageUrl: String
    let productName: String
    let freeShipment: Bool
    let productPrice: Int
    let productOriginalPrice: Int
    let availableQuantity: Int
    let attributes: [ResultAttribute]
}
