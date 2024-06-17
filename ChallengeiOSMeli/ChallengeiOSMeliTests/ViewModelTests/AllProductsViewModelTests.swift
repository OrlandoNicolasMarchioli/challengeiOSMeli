//
//  AllProductsViewModelTests.swift
//  ChallengeiOSMeliTests
//
//  Created by Nico on 17/06/2024.
//

import XCTest
import Combine
@testable import ChallengeiOSMeli

class AllProductsViewModelTests: XCTestCase {
    var viewModel: AllProductsViewModel!
    var productsFetchUseCaseMock: MockProductsFetchUseCase!
    var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        productsFetchUseCaseMock = MockProductsFetchUseCase(allProductsRepository: ProductsApiFetch(productsApi: ProductApi.getInstance()) )
        viewModel = AllProductsViewModel(productsFetchUseCase: productsFetchUseCaseMock)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        productsFetchUseCaseMock = nil
        cancellables = []
    }

    func testFetchProducts_Success() {
        // Given
        let products = [
            SelectedProductData(id: "1", imageUrl: "http://image1.jpg", productName: "Product 1", freeShipment: true, productPrice: 100, productOriginalPrice: 150, availableQuantity: 10, attributeNames: ["Attribute 1"], sellerName: "Seller 1")
        ]
        productsFetchUseCaseMock.products = products
        let expectation = XCTestExpectation(description: "Fetch products successfully")

        // When
        viewModel.fetchProductsByName(productName: "Product")
        
        // Then
        viewModel.$state
            .sink { state in
                if !state.products.isEmpty {
                    XCTAssertEqual(state.products.count, 1)
                    XCTAssertEqual(state.products.first?.productName, "Product 1")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5)
    }

    func testFetchProducts_Failure() {
        // Given
        productsFetchUseCaseMock.error = FetchError.getProductsError
        let expectation = XCTestExpectation(description: "Fetch products with failure")

        // When
        viewModel.fetchProductsByName(productName: "Product")
        
        // Then
        viewModel.$state
            .sink { state in
                if state.hasError {
                    XCTAssertEqual(state.errorMessage, FetchError.getProductsError.localizedDescription)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5)
    }

    func testFetchProducts_NoProductsFound() {
        // Given
        productsFetchUseCaseMock.products = []
        let expectation = XCTestExpectation(description: "Fetch products with no products found")

        // When
        viewModel.fetchProductsByName(productName: "Product")
        
        // Then
        viewModel.$state
            .sink { state in
                if state.noProductsFound {
                    XCTAssertTrue(state.noProductsFound)
                    XCTAssertTrue(state.products.isEmpty)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5)
    }
}

class MockProductsFetchUseCase: DefaultProductsFetchUseCase {
    var products: [SelectedProductData] = []
    var error: Error?

    override func getProductsByName(productName: String) -> AnyPublisher<[SelectedProductData], Error> {
        if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        } else {
            return Just(products)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
