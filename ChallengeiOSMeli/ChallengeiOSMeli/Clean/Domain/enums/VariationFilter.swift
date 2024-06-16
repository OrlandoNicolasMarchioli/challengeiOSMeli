//
//  VariationFilter.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import Foundation

enum VariationFilter: String, Codable {
    case alphanumericModel = "ALPHANUMERIC_MODEL"
    case brand = "BRAND"
    case color = "COLOR"
    case detailedModel = "DETAILED_MODEL"
    case gpuModel = "GPU_MODEL"
    case gtin = "GTIN"
    case itemCondition = "ITEM_CONDITION"
    case line = "LINE"
    case mainColor = "MAIN_COLOR"
    case model = "MODEL"
    case packageLength = "PACKAGE_LENGTH"
    case packageWeight = "PACKAGE_WEIGHT"
    case processorModel = "PROCESSOR_MODEL"
    case weight = "WEIGHT"
}
