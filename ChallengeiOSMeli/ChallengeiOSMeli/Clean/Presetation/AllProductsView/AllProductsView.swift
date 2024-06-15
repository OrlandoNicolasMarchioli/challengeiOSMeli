//
//  AllProductsView.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import SwiftUI

struct AllProductsView: View {
    @ObservedObject var allProductsViewModel = AllProductsViewModel( productsFetchUseCase: DefaultProductsFetchUseCase(allProductsRepository: ProductsApiFetch(productsApi: ProductApi.getInstance())))
    
    
    let imageBaseURL: String = ProcessInfo.processInfo.environment["baseImageUrl"] ?? ""
    @State var filterName: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    VStack(alignment: .center) {
                        VStack(alignment: .trailing){
                            HStack(){
                                Spacer()
                                TextField("Search Movie: ", text: $filterName)
                                    .foregroundColor(Color.white)
                                    .frame(minWidth: 100)
                                    .padding(.leading)
                                
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.red)
                                    .bold()
                                    .padding(.trailing)
                            }
                        }
                        .frame(width: geometry.size.width)
                        Text("Premieres")
                            .foregroundColor(Color("MovieTitle"))
                            .frame(height: 50)
                            .font(.title)
                            .bold()
                        if(!allProductsViewModel.state.noProductsFound
                        ){
                            ScrollView {
                                Grid(alignment: .center, horizontalSpacing: 16, verticalSpacing: 16) {
                                    ForEach(allProductsViewModel.state.products) { product in NavigationLink(destination: ProductDetailView())
                                        {
                                            ProductCellChip<Product>(item: product,
                                                                     getProductImageUrl: { item in item.thumbnail },
                                                                     getProductName: { item in item.title }
                                                                     ,
                                                                     getProductPrice: { item in item.originalPrice!}
                                                                     ,
                                                getProductOriginalPrice: { item in item.price }
                                                                     ,
                                                                     getAvailableQuantity: { item in item.availableQuantity },
                                                onChipTapped: {
                                            })
                                        }
                                    }
                                }
                            }
                        }
                        else{
                            Spacer()
                            NoProductFoundView()
                            Spacer()
                        }
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
