//
//  ProductCell.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation
import SwiftUI

struct ProductCell: View {
    @State var product: SelectedProductData
    
    var body: some View {
        HStack{
            
        }
    }
}

// Vista para mostrar una celda de producto con genéricos
struct ProductCellChip<T>: View {
    let item: T
    let getProductImageUrl: ((T) -> String)
    let getProductName: ((T) -> String)
    let getFreeShipment: ((T) -> Bool)
    let getProductPrice: ((T) -> Double)
    let getProductOriginalPrice: ((T) -> Double?)
    let getAvailableQuantity: ((T) -> Int)
    let onChipTapped: (() -> Void)
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                ZStack {
                    
                    Rectangle()
                        .fill(Color("backgroundImageGray"))
                        .frame(maxWidth: 200, maxHeight: 220)
                        .cornerRadius(8)
                    
                    AsyncImage(url:  URL(string: convertToSecureURL(getProductImageUrl(item)))) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                                .scaleEffect(2.0)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 200)
                                .cornerRadius(8)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 100)
                                .cornerRadius(8)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                .padding(.leading)
                
                VStack(alignment: .leading) {
                    Text(getProductName(item))
                        .foregroundColor(Color("grayTitle"))
                        .bold()
                        .font(.callout)
                        .padding(.bottom, 10)
                    if (getProductOriginalPrice(item) != nil && getProductOriginalPrice(item) != getProductPrice(item)){
                        Text(" $\(getProductOriginalPrice(item)!.formatted(.number.precision(.fractionLength(0...2))))")
                            .foregroundColor(Color("grayTitle"))
                            .strikethrough()
                            .font(.subheadline)
                    }
                    Text("$\(getProductPrice(item).formatted(.number.precision(.fractionLength(0...2))))")
                        .foregroundColor(Color.black)
                        .bold()
                        .font(.title3)
                        .padding(.bottom, 10)
                    if (getFreeShipment(item)) {
                        Text("Envio gratis")
                            .foregroundColor(Color.green)
                            .font(.subheadline)
                            .bold()
                    }
                    Text("Disponible: \(getAvailableQuantity(item))")
                        .foregroundColor(Color("grayTitle"))
                        .font(.subheadline)
                    Spacer()
                }.padding(.trailing)
                
            }
        }
        .onTapGesture {
            onChipTapped()
        }
    }
}

private func convertToSecureURL(_ urlString: String) -> String {
    var secureURLString = urlString
    if urlString.hasPrefix("http://") {
        secureURLString = "https://" + urlString.dropFirst(7)
    }
    return secureURLString
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellChip<SelectedProductData>(item: SelectedProductData(id: "MLA1515207466",imageUrl: "http://http2.mlstatic.com/D_947190-MLA73734741684_012024-I.jpg", productName: "Motorola G54 5G 16GB RAM", freeShipment: true, productPrice: 1200, productOriginalPrice: 1300, availableQuantity: 3, attributeNames: ["Screen"], sellerName: "Mercado Libre"), getProductImageUrl: {item in return item.imageUrl}, getProductName: {item in return item.productName}, getFreeShipment: {item in return item.freeShipment}, getProductPrice: {item in return item.productPrice}, getProductOriginalPrice: {item in return item.productOriginalPrice}, getAvailableQuantity: {item in return item.availableQuantity},onChipTapped: {} )
    }
}

