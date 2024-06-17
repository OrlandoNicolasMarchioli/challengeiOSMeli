//
//  ProductCell.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation
import SwiftUI

struct ProductDetail: View {
    @State var product: SelectedDetailProductData
    
    var body: some View {
        HStack{
            
        }
    }
}

// Vista para mostrar una celda de producto con genéricos
struct ProductDetailCellChip<T>: View {
    let item: T
    let getProductImageUrl: ((T) -> String)
    let getProductName: ((T) -> String)
    let getFreeShipment: ((T) -> Bool)
    let getProductPrice: ((T) -> Double)
    let getProductOriginalPrice: ((T) -> Double?)
    let getAvailableQuantity: ((T) -> Int)
    let getAttributes: ((T) -> [ResultAttribute])
    let onChipTapped: (() -> Void)
    
    var body: some View {
        VStack(alignment: .leading){
            Text(getProductName(item))
                .foregroundColor(Color.black)

                .font(.title3)
                .padding(.bottom, 10)
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                
                AsyncImage(url: URL(string: convertToSecureURL(getProductImageUrl(item)))) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                            .scaleEffect(2.0)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()

                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 250)
                            .cornerRadius(8)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            .padding()
            HStack {
                
                VStack(alignment: .leading) {

                    if let originalPrice = getProductOriginalPrice(item) {
                        Text("$ \(originalPrice)")
                            .foregroundColor(Color("grayTitle"))
                            .strikethrough()
                            .font(.title3)
                    }
                    Text("$ \(getProductPrice(item))")
                        .foregroundColor(Color.black)
                        .bold()
                        .font(.title)
                        .padding(.bottom, 10)
                    if (getFreeShipment(item)) {
                        //TODO: to replase with the value of the product
                        Text("ShipmentType.freeSHipment.rawValue")
                            .foregroundColor(Color.green)
                            .font(.subheadline)
                            .bold()
                    }
                    Text("Caracteristicas del producto")
                        .foregroundColor(Color.black)
                        .font(.title3)
                        .padding(.top, 10)
                    ForEach(getAttributes(item), id: \.id) { attribute in
                        Text("\(attribute.name): \(attribute.valueName)")
                            .foregroundColor(Color.black)
                            .font(.subheadline)
                    }
                }
            }
        }
        .onTapGesture {
            onChipTapped()
        }
        .padding()
    }
}

private func convertToSecureURL(_ urlString: String) -> String {
    var secureURLString = urlString
    if urlString.hasPrefix("http://") {
        secureURLString = "https://" + urlString.dropFirst(7)
    }
    return secureURLString
}

struct ProductDetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailCellChip<SelectedProductData>(item: SelectedProductData(id: "MLA1515207466", imageUrl: "http://http2.mlstatic.com/D_947190-MLA73734741684_012024-I.jpg", productName: "Motorola", freeShipment: true, productPrice: 1200, productOriginalPrice: 1300, availableQuantity: 3), getProductImageUrl: {item in return item.imageUrl}, getProductName: {item in return item.productName}, getFreeShipment: {item in return item.freeShipment}, getProductPrice: {item in return item.productPrice}, getProductOriginalPrice: {item in return item.productOriginalPrice}, getAvailableQuantity: {item in return item.availableQuantity},onChipTapped: {} )
    }
}

