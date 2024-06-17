//
//  ProductDetailView.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import SwiftUI

struct ProductDetailView: View {
    @State var product: SelectedProductData
    
    init(product: SelectedProductData) {
        self.product = product
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                ZStack{
                    VStack{
                        ProductDetailCellChip<SelectedProductData>(item: product,
                                                                   getProductImageUrl: { item in item.imageUrl },
                                                                   getProductName: { item in item.productName }, getFreeShipment: {item in item.freeShipment}
                                                                   ,
                                                                   getProductPrice: { item in item.productPrice}
                                                                   ,
                                                                   getProductOriginalPrice: { item in item.productOriginalPrice  }
                                                                   ,
                                                                   getAvailableQuantity: { item in item.availableQuantity }, getAttributeNames: {item in item.attributeNames}, getSellerName: {item in item.sellerName},
                                                                   onChipTapped: {
                        })
                    }
                }
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: SelectedProductData(id: "MLA1515207466", imageUrl: "http://http2.mlstatic.com/D_947190-MLA73734741684_012024-I.jpg", productName: "Motorola", freeShipment: true, productPrice: 1200, productOriginalPrice: 1300, availableQuantity: 3, attributeNames:  ["Screen"], sellerName: "Mercado Libre Arg"))
    }
}
