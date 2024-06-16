//
//  ResultItem.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Product: Codable, Identifiable {
    let id, title: String
    let condition: String
    let thumbnailID: String
    let catalogProductID: String?
    let listingTypeID: String
    let permalink: String
    let buyingMode: String
    let siteID: SiteID
    let categoryID: String
    let domainID: String
    let thumbnail: String
    let currencyID: CurrencyID
    let orderBackend: Int
    let price: Int
    let originalPrice: Int?
    let salePrice: JSONNull?
    let availableQuantity: Int
    let officialStoreID: Int?
    let officialStoreName: String?
    let useThumbnailID, acceptsMercadopago: Bool
    let shipping: Shipping
    let stopTime: String
    let seller: Seller
    let attributes: [ResultAttribute]
    let installments: Installments
    let winnerItemID: JSONNull?
    let catalogListing: Bool
    let discounts: JSONNull?
    let promotions: [JSONAny]
    let differentialPricing: DifferentialPricing?
    let inventoryID: String?
    let variationID: String?
    let variationFilters: [String]?
    let variationsData: [VariationsDatum]?
    
    enum CodingKeys: String, CodingKey {
        case id, title, condition
        case thumbnailID = "thumbnail_id"
        case catalogProductID = "catalog_product_id"
        case listingTypeID = "listing_type_id"
        case permalink
        case buyingMode = "buying_mode"
        case siteID = "site_id"
        case categoryID = "category_id"
        case domainID = "domain_id"
        case thumbnail
        case currencyID = "currency_id"
        case orderBackend = "order_backend"
        case price
        case originalPrice = "original_price"
        case salePrice = "sale_price"
        case availableQuantity = "available_quantity"
        case officialStoreID = "official_store_id"
        case officialStoreName = "official_store_name"
        case useThumbnailID = "use_thumbnail_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case shipping
        case stopTime = "stop_time"
        case seller, attributes, installments
        case winnerItemID = "winner_item_id"
        case catalogListing = "catalog_listing"
        case discounts, promotions
        case differentialPricing = "differential_pricing"
        case inventoryID = "inventory_id"
        case variationID = "variation_id"
        case variationFilters = "variation_filters"
        case variationsData = "variations_data"
    }
    
}


