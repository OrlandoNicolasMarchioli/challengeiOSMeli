//
//  ProductApiTests.swift
//  ChallengeiOSMeliTests
//
//  Created by Nico on 17/06/2024.
//
import Foundation
import XCTest
@testable import ChallengeiOSMeli

class ProductApiTests: XCTestCase {
    var api: ProductApi!

    override func setUpWithError() throws {
        api = ProductApi(baseUrl: ProcessInfo.processInfo.environment["baseUrl"] ?? "")
    }

    func testGetAllProducts() {
        // Given
        let productName = "testProduct"

        // When
        api.getAllProducts(productName: productName) { result, error in
            // Then
            if let result = result {
                print("Response: \(result)")
                XCTAssertNotNil(result)
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
                XCTFail("Failed to fetch products")
            }
        }
    }
}
