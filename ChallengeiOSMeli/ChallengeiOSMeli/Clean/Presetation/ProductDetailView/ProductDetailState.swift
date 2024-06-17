//
//  ProductDetailState.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation


struct ProductDetailState{
    let product: SelectedDetailProductData
    let errorMessage: String
    let message: String
    let hasError: Bool
    
    func clone(withProduct: SelectedDetailProductData? = nil, withErrorMessage: String? = nil, withMessage: String? = nil, withHasError: Bool? = false) -> ProductDetailState{
        return  ProductDetailState(product: withProduct ?? self.product,errorMessage: withErrorMessage ?? self.errorMessage, message: withMessage ?? self.message, hasError: withHasError ?? self.hasError)
    }
}
