//
//  ProductsRepositoryTests.swift
//  ChallengeiOSMeliTests
//
//  Created by Nico on 17/06/2024.
//

import XCTest
import Combine
@testable import ChallengeiOSMeli

class ProductsRepositoryTests: XCTestCase {
    var productsApiMock: ProductsApiProtocol!
    var apiService: ProductsApiFetch!
    var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        productsApiMock = MockProductsApi()
        apiService = ProductsApiFetch(productsApi: productsApiMock)
        (productsApiMock as? MockProductsApi)?.productName = "Motorola"
    }

    func testFetchProducts() {
        // Given
        let productName = "Motorola"
        let expectation = self.expectation(description: "Fetching products")

        // When
        apiService.fetchProducts(productName: productName).sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                XCTFail("Failed to fetch products: \(error)")
            }
        } receiveValue: { products in
            // Then
            XCTAssertEqual(products.count, 1)
            let product = products.first
            XCTAssertNotNil(product)

            XCTAssertEqual(product?.imageUrl, "http://http2.mlstatic.com/D_947190-MLA73734741684_012024-I.jpg")
            XCTAssertEqual(product?.productName, "Motorola")
            XCTAssertEqual(product?.productPrice, 419999.0)
            XCTAssertEqual(product?.productOriginalPrice, 449999.0)
            XCTAssertEqual(product?.availableQuantity, 250)
            XCTAssertEqual(product?.sellerName, "MERCADOLIBRE ELECTRONICA_AR")
            XCTAssertEqual(product?.attributeNames.count, 2)
            expectation.fulfill()
        }.store(in: &cancellables)

        waitForExpectations(timeout: 5, handler: nil)
    }
}


class MockProductsApi: ProductsApiProtocol {
    var productName: String?

    func getAllProducts(productName: String, completion: @escaping ([String: Any]?, Error?) -> Void) {
        if productName == self.productName {
            let response: [String: Any] = [
                "site_id": "MLA",
                "country_default_time_zone": "GMT-03:00",
                "query": productName,
                "paging": [
                    "total": 5163,
                    "primary_results": 1000,
                    "offset": 0,
                    "limit": 50
                ],
                "results": [
                    [
                        "id": "MLA1401877995",
                        "title": "Motorola",
                        "condition": "new",
                        "thumbnail": "http://http2.mlstatic.com/D_947190-MLA73734741684_012024-I.jpg",
                        "price": 419999.0,
                        "original_price": 449999.0,
                        "available_quantity": 250,
                        "seller": [
                            "id": 608846165,
                            "nickname": "MERCADOLIBRE ELECTRONICA_AR"
                        ],
                        "attributes": [
                            [
                                "id": "BRAND",
                                "name": "Marca",
                                "value_name": "Motorola"
                            ],
                            [
                                "id": "COLOR",
                                "name": "Color",
                                "value_name": "Verde"
                            ]
                        ],
                        "shipping": [
                            "free_shipping": true
                        ]
                    ]
                ]
            ]
            completion(response, nil)
        } else {
            completion(nil, NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Product not found"]))
        }
    }
}
