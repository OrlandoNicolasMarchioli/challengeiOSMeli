//
//  ProductsFetchUseCase.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation
import Combine

protocol ProductFetchUseCase{
    func getProductsByName(productName: String) -> AnyPublisher<[Product], Error>
}


class DefaultProductsFetchUseCase: ProductFetchUseCase{

    private let allProductsRepository: AllProductsRepository
    
    init(allProductsRepository: AllProductsRepository) {
        self.allProductsRepository = allProductsRepository
    }
    
    func getProductsByName(productName: String) -> AnyPublisher<[Product], Error> {
        return allProductsRepository.fetchProducts(productName: productName).map{result in
            return result
        }.mapError{err in
            return err
        }
        .eraseToAnyPublisher()
    }
    
    
}
