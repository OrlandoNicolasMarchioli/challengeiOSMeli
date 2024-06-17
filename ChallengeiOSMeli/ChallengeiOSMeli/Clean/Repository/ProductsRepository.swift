//
//  ProductsRepository.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation
import Combine

protocol AllProductsRepository{
    func fetchProducts(productName: String) -> AnyPublisher<[SelectedProductData], FetchError>
}

class ProductsApiFetch: AllProductsRepository{
    private var productsApi: ProductsApiProtocol
    
    init(productsApi: ProductsApiProtocol) {
        self.productsApi = productsApi
    }
    
    func fetchProducts(productName: String) -> AnyPublisher<[SelectedProductData], FetchError> {
        return Future<[SelectedProductData], Error>{ [self] promise in

                self.productsApi.getAllProducts(productName: productName){ (response, err) in
                    guard let response = response, err == nil else{
                        promise(.failure(FetchError.getProductsError))
                        return
                    }
                    promise(.success(mapJSONToSelectedProductData(json: response)))
                }
            
        }
        .mapError { _ in FetchError.getProductsError }
        .eraseToAnyPublisher()
    }
    
}

func mapJSONToSelectedProductData(json: [String: Any?]) -> [SelectedProductData] {
    guard let results = json["results"] as? [[String: Any]] else {
        return []
    }
    
    var products: [SelectedProductData] = []
    
    for result in results {
        if let imageUrl = result["thumbnail"] as? String,
           let productName = result["title"] as? String,
           let productPrice = result["price"] as? Double,
           let productOriginalPrice = result["original_price"] as? Double,
           let availableQuantity = result["available_quantity"] as? Int,
           let shipping = result["shipping"] as? [String: Any],
           let freeShipment = shipping["free_shipping"] as? Bool,
           let id = result["id"] as? String {
            
            let product = SelectedProductData(
                id: id,
                imageUrl: imageUrl,
                productName: productName,
                freeShipment: freeShipment,
                productPrice: productPrice,
                productOriginalPrice: productOriginalPrice,
                availableQuantity: availableQuantity
            )
            
            products.append(product)
        }
    }
    
    return products
}
