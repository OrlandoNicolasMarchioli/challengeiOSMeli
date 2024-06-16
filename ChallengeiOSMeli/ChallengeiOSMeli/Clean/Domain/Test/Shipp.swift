/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Shipping : Codable {
	let store_pick_up : Bool?
	let free_shipping : Bool?
	let logistic_type : String?
	let mode : String?
	let tags : [String]?
	let benefits : String?
	let promise : String?
	let shipping_score : Int?

	enum CodingKeys: String, CodingKey {

		case store_pick_up = "store_pick_up"
		case free_shipping = "free_shipping"
		case logistic_type = "logistic_type"
		case mode = "mode"
		case tags = "tags"
		case benefits = "benefits"
		case promise = "promise"
		case shipping_score = "shipping_score"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		store_pick_up = try values.decodeIfPresent(Bool.self, forKey: .store_pick_up)
		free_shipping = try values.decodeIfPresent(Bool.self, forKey: .free_shipping)
		logistic_type = try values.decodeIfPresent(String.self, forKey: .logistic_type)
		mode = try values.decodeIfPresent(String.self, forKey: .mode)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		benefits = try values.decodeIfPresent(String.self, forKey: .benefits)
		promise = try values.decodeIfPresent(String.self, forKey: .promise)
		shipping_score = try values.decodeIfPresent(Int.self, forKey: .shipping_score)
	}

}