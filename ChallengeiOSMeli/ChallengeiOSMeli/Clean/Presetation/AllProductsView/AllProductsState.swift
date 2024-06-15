//
//  AllProductsState.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

struct AllProductsState{
    
    let products: [Product]
    let errorMessage: String
    let message: String
    let hasError: Bool
    let noProductsFound: Bool
    
    func clone(productsFetched: [Product]? = nil, withErrorMessage: String? = nil, withMessage: String? = nil, withHasError: Bool? = false, withNoProductsFound: Bool? = false) -> AllProductsState{
        return  AllProductsState(products: productsFetched ?? self.products,errorMessage: withErrorMessage ?? self.errorMessage, message: withMessage ?? self.message, hasError: withHasError ?? self.hasError, noProductsFound: withNoProductsFound ?? self.noProductsFound)
    }
}
