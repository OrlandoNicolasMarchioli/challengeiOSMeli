//
//  ResultItem.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: String
    let title: String
    let condition: String
    let thumbnailId: String
    let catalogProductId: String
    let listingTypeId: String
    let permalink: String
    let buyingMode: String
    let siteId: String
    let categoryId: String
    let domainId: String
    let thumbnail: String
    let currencyId: String
    let orderBackend: Int
    let price: Int
    let originalPrice: Int?
    let salePrice: Int?
    let availableQuantity: Int
    let officialStoreId: Int?
    let officialStoreName: String?
    let useThumbnailId: Bool
    let acceptsMercadopago: Bool
    let shipping: Shipping
    let stopTime: String
    let seller: Seller
    let attributes: [Attribute]
    let installments: Installments
    let winnerItemId: String?
    let catalogListing: Bool
    let discounts: String?
    let promotions: [String]
    let differentialPricing: DifferentialPricing
    let inventoryId: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, condition
        case thumbnailId = "thumbnail_id"
        case catalogProductId = "catalog_product_id"
        case listingTypeId = "listing_type_id"
        case permalink
        case buyingMode = "buying_mode"
        case siteId = "site_id"
        case categoryId = "category_id"
        case domainId = "domain_id"
        case thumbnail
        case currencyId = "currency_id"
        case orderBackend = "order_backend"
        case price
        case originalPrice = "original_price"
        case salePrice = "sale_price"
        case availableQuantity = "available_quantity"
        case officialStoreId = "official_store_id"
        case officialStoreName = "official_store_name"
        case useThumbnailId = "use_thumbnail_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case shipping
        case stopTime = "stop_time"
        case seller
        case attributes
        case installments
        case winnerItemId = "winner_item_id"
        case catalogListing = "catalog_listing"
        case discounts
        case promotions
        case differentialPricing = "differential_pricing"
        case inventoryId = "inventory_id"
    }
}


