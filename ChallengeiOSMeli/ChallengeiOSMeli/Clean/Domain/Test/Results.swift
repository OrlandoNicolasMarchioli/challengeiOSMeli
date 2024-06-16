/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Results : Codable {
	let id : String?
	let title : String?
	let condition : String?
	let thumbnail_id : String?
	let catalog_product_id : String?
	let listing_type_id : String?
	let permalink : String?
	let buying_mode : String?
	let site_id : String?
	let category_id : String?
	let domain_id : String?
	let thumbnail : String?
	let currency_id : String?
	let order_backend : Int?
	let price : Int?
	let original_price : Int?
	let sale_price : String?
	let available_quantity : Int?
	let official_store_id : Int?
	let official_store_name : String?
	let use_thumbnail_id : Bool?
	let accepts_mercadopago : Bool?
	let shipping : Shipping?
	let stop_time : String?
	let seller : Seller?
	let attributes : [Attributes]?
	let installments : Installments?
	let winner_item_id : String?
	let catalog_listing : Bool?
	let discounts : String?
	let promotions : [String]?
	let differential_pricing : Differential_pricing?
	let inventory_id : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case title = "title"
		case condition = "condition"
		case thumbnail_id = "thumbnail_id"
		case catalog_product_id = "catalog_product_id"
		case listing_type_id = "listing_type_id"
		case permalink = "permalink"
		case buying_mode = "buying_mode"
		case site_id = "site_id"
		case category_id = "category_id"
		case domain_id = "domain_id"
		case thumbnail = "thumbnail"
		case currency_id = "currency_id"
		case order_backend = "order_backend"
		case price = "price"
		case original_price = "original_price"
		case sale_price = "sale_price"
		case available_quantity = "available_quantity"
		case official_store_id = "official_store_id"
		case official_store_name = "official_store_name"
		case use_thumbnail_id = "use_thumbnail_id"
		case accepts_mercadopago = "accepts_mercadopago"
		case shipping = "shipping"
		case stop_time = "stop_time"
		case seller = "seller"
		case attributes = "attributes"
		case installments = "installments"
		case winner_item_id = "winner_item_id"
		case catalog_listing = "catalog_listing"
		case discounts = "discounts"
		case promotions = "promotions"
		case differential_pricing = "differential_pricing"
		case inventory_id = "inventory_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		condition = try values.decodeIfPresent(String.self, forKey: .condition)
		thumbnail_id = try values.decodeIfPresent(String.self, forKey: .thumbnail_id)
		catalog_product_id = try values.decodeIfPresent(String.self, forKey: .catalog_product_id)
		listing_type_id = try values.decodeIfPresent(String.self, forKey: .listing_type_id)
		permalink = try values.decodeIfPresent(String.self, forKey: .permalink)
		buying_mode = try values.decodeIfPresent(String.self, forKey: .buying_mode)
		site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
		category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
		domain_id = try values.decodeIfPresent(String.self, forKey: .domain_id)
		thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
		currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
		order_backend = try values.decodeIfPresent(Int.self, forKey: .order_backend)
		price = try values.decodeIfPresent(Int.self, forKey: .price)
		original_price = try values.decodeIfPresent(Int.self, forKey: .original_price)
		sale_price = try values.decodeIfPresent(String.self, forKey: .sale_price)
		available_quantity = try values.decodeIfPresent(Int.self, forKey: .available_quantity)
		official_store_id = try values.decodeIfPresent(Int.self, forKey: .official_store_id)
		official_store_name = try values.decodeIfPresent(String.self, forKey: .official_store_name)
		use_thumbnail_id = try values.decodeIfPresent(Bool.self, forKey: .use_thumbnail_id)
		accepts_mercadopago = try values.decodeIfPresent(Bool.self, forKey: .accepts_mercadopago)
		shipping = try values.decodeIfPresent(Shipping.self, forKey: .shipping)
		stop_time = try values.decodeIfPresent(String.self, forKey: .stop_time)
		seller = try values.decodeIfPresent(Seller.self, forKey: .seller)
		attributes = try values.decodeIfPresent([Attributes].self, forKey: .attributes)
		installments = try values.decodeIfPresent(Installments.self, forKey: .installments)
		winner_item_id = try values.decodeIfPresent(String.self, forKey: .winner_item_id)
		catalog_listing = try values.decodeIfPresent(Bool.self, forKey: .catalog_listing)
		discounts = try values.decodeIfPresent(String.self, forKey: .discounts)
		promotions = try values.decodeIfPresent([String].self, forKey: .promotions)
		differential_pricing = try values.decodeIfPresent(Differential_pricing.self, forKey: .differential_pricing)
		inventory_id = try values.decodeIfPresent(String.self, forKey: .inventory_id)
	}

}