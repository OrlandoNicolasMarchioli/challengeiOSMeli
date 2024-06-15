//
//  ProductsRepository.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation
import Combine

protocol AllProductsRepository{
    func fetchProducts(productName: String) -> AnyPublisher<[Product], FetchError>
}

class ProductsApiFetch: AllProductsRepository{
    private var productsApi: ProductsApiProtocol
    
    init(productsApi: ProductsApiProtocol) {
        self.productsApi = productsApi
    }
    
    func fetchProducts(productName: String) -> AnyPublisher<[Product], FetchError> {
        return Future<[Product], Error>{ [self] promise in

                self.productsApi.getAllProducts(productName: productName){ (response, err) in
                    guard let response = response, err == nil else{
                        promise(.failure(FetchError.getProductsError))
                        return
                    }
                    promise(.success(response.results))
                }
            
        }
        .mapError { _ in FetchError.getProductsError }
        .eraseToAnyPublisher()
    }
    
}
