//
//  AllProductsViewModel.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation
import Combine

class AllProductsViewModel: ObservableObject{
    @Published var state: AllProductsState
    static let defaultState = AllProductsState(products: [], errorMessage: "", message: "", hasError: false, noProductsFound: true)
    private let productsFetchUseCase: DefaultProductsFetchUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    init(initialState: AllProductsState = defaultState, productsFetchUseCase: DefaultProductsFetchUseCase) {
        self.state = initialState
        self.productsFetchUseCase = productsFetchUseCase
    }

    func fetchProductsByName(productName: String) -> Void{
        productsFetchUseCase.getProductsByName(productName: productName)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error.localizedDescription)
                        self?.state = (self?.state.clone(productsFetched: [], withErrorMessage: error.localizedDescription, withMessage: "", withHasError: true, withNoProductsFound: true))!
                    }
                }
            },
                  receiveValue: {
                products in DispatchQueue.main.async{
                    if(products.isEmpty){
                        self.state = self.state.clone(withNoProductsFound: true)
                    }else{
                        self.state = self.state.clone(productsFetched: products)
                    }
                }
            })
            .store(in: &cancellables)
    }
    

}
