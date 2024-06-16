/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Json4Swift_Base : Codable {
	let site_id : String?
	let country_default_time_zone : String?
	let query : String?
	let paging : Paging?
	let results : [Results]?
	let sort : Sort?
	let available_sorts : [Available_sorts]?
	let filters : [Filters]?
	let available_filters : [Available_filters]?
	let pdp_tracking : Pdp_tracking?
	let user_context : String?

	enum CodingKeys: String, CodingKey {

		case site_id = "site_id"
		case country_default_time_zone = "country_default_time_zone"
		case query = "query"
		case paging = "paging"
		case results = "results"
		case sort = "sort"
		case available_sorts = "available_sorts"
		case filters = "filters"
		case available_filters = "available_filters"
		case pdp_tracking = "pdp_tracking"
		case user_context = "user_context"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
		country_default_time_zone = try values.decodeIfPresent(String.self, forKey: .country_default_time_zone)
		query = try values.decodeIfPresent(String.self, forKey: .query)
		paging = try values.decodeIfPresent(Paging.self, forKey: .paging)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
		sort = try values.decodeIfPresent(Sort.self, forKey: .sort)
		available_sorts = try values.decodeIfPresent([Available_sorts].self, forKey: .available_sorts)
		filters = try values.decodeIfPresent([Filters].self, forKey: .filters)
		available_filters = try values.decodeIfPresent([Available_filters].self, forKey: .available_filters)
		pdp_tracking = try values.decodeIfPresent(Pdp_tracking.self, forKey: .pdp_tracking)
		user_context = try values.decodeIfPresent(String.self, forKey: .user_context)
	}

}