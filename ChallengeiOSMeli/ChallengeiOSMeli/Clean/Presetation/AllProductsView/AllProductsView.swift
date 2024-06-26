//
//  AllProductsView.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import SwiftUI

struct AllProductsView: View {
    @ObservedObject var allProductsViewModel = AllProductsViewModel( productsFetchUseCase: DefaultProductsFetchUseCase(allProductsRepository: ProductsApiFetch(productsApi: ProductApi.getInstance())))
    
    @State var noProductFound = false
    let imageBaseURL: String = ProcessInfo.processInfo.environment["baseImageUrl"] ?? ""
    @State var filterName: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    VStack(alignment: .center) {
                        VStack(alignment: .trailing){
                            HStack {
                                TextField("Search products: ", text: $filterName)
                                    .foregroundColor(Color.black)
                                    .frame(minWidth: 100)
                                    .padding(.leading)
                                
                                Button(action: {
                                    allProductsViewModel.fetchProductsByName(productName:  filterName)
                                }) {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(Color("yellowMeli"))
                                        .bold()
                                        .padding(.trailing)
                                }.padding()
                            }
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("yellowMeli"), lineWidth: 2) 
                            )
        
                        }
                        .frame(width: geometry.size.width)
                        .padding(.top)
                        
                        if(!allProductsViewModel.state.noProductsFound
                        ){
                            ScrollView {
                                Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 16) {
                                    ForEach(allProductsViewModel.state.products) { product in NavigationLink(destination: ProductDetailView(product: product))
                                        {
                                            ProductCellChip<SelectedProductData>(item: product,
                                                                                 getProductImageUrl: { item in item.imageUrl },
                                                                                 getProductName: { item in item.productName }, getFreeShipment: {item in item.freeShipment}
                                                                     ,
                                                                                 getProductPrice: { item in item.productPrice}
                                                                     ,
                                                                                 getProductOriginalPrice: { item in item.productOriginalPrice  }
                                                                     ,
                                                                     getAvailableQuantity: { item in item.availableQuantity },
                                                                     onChipTapped: {
                                            })
                                        }
                                    }
                                }
                            }
                        }
                        else if(allProductsViewModel.state.products.isEmpty && !allProductsViewModel.state.hasError){
                            Spacer()
                            EmptySearchView()
                            Spacer()
                        }
                        else if (noProductFound){
                            Spacer()
                            NoProductFoundView()
                            Spacer()
                        }
                            
                    }
                }.onReceive(self.allProductsViewModel.$state){state in
                    if(state.noProductsFound){
                        noProductFound = true
                    }
                }
                
            }
        }
    }
}

struct AllProductsView_Previews: PreviewProvider {
    static var previews: some View {
        AllProductsView()
    }
}
