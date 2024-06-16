//
//  ProductCell.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation
import SwiftUI

struct ProductCell: View {
    @State var product: Product
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color("grayTitle"))
                    .frame(maxWidth: 150, maxHeight: 200)
                    .cornerRadius(8)
                
                AsyncImage(url: URL(string: product.thumbnail)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                            .scaleEffect(2.0)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 100)
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
            .padding()
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .foregroundColor(Color("MovieTitle"))
                    .bold()
                    .font(.title2)
                    .padding(.bottom, 10)
                Text("$\(product.price, specifier: "%.2f")")
                    .foregroundColor(Color("MovieTitle"))
                    .bold()
                    .font(.title3)
                    .padding(.bottom, 10)
                if let originalPrice = product.originalPrice {
                    Text("Original: $\(originalPrice, specifier: "%.2f")")
                        .foregroundColor(Color.gray)
                        .strikethrough()
                        .font(.subheadline)
                }
                Text("Available: \(product.availableQuantity)")
                    .foregroundColor(Color("MovieTitle"))
                    .font(.subheadline)
            }
        }
        .padding(.bottom)
    }
}

// Vista para mostrar una celda de producto con genéricos
struct ProductCellChip<T>: View {
    let item: T
    let getProductImageUrl: ((T) -> String)
    let getProductName: ((T) -> String)
    let getProductPrice: ((T) -> Int)
    let getProductOriginalPrice: ((T) -> Int?)
    let getAvailableQuantity: ((T) -> Int)
    let onChipTapped: (() -> Void)
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color("lightGray"))
                        .frame(maxWidth: 200, maxHeight: 200)
                        .cornerRadius(8)
                    
                    AsyncImage(url: URL(string: getProductImageUrl(item))) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                                .scaleEffect(2.0)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 100)
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
                .padding()
                
                VStack(alignment: .leading) {
                    Text(getProductName(item))
                        .foregroundColor(Color("grayTitle"))
                        .bold()
                        .font(.title2)
                        .padding(.bottom, 10)
                    if let originalPrice = getProductOriginalPrice(item) {
                        Text("Original: $\(originalPrice, specifier: "%.2f")")
                            .foregroundColor(Color("grayTitle"))
                            .strikethrough()
                            .font(.subheadline)
                    }
                    Text("$\(getProductPrice(item), specifier: "%.2f")")
                        .foregroundColor(Color.black)
                        .bold()
                        .font(.title3)
                        .padding(.bottom, 10)
                    Text("Available: \(getAvailableQuantity(item))")
                        .foregroundColor(Color("grayTitle"))
                        .font(.subheadline)
                }
            }
        }
        .onTapGesture {
            onChipTapped()
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellChip<SelectedProductData>(item: SelectedProductData(imageUrl: "https://www.mercadolibre.com.ar/motorola-moto-g54-5g-128-gb-verde-4-gb-ram/p/MLA29471800", productName: "Motorola", productPrice: 1200, productOriginalPrice: 1300, availableQuantity: 3), getProductImageUrl: {item in return item.imageUrl}, getProductName: {item in return item.productName}, getProductPrice: {item in return item.productPrice}, getProductOriginalPrice: {item in return item.productOriginalPrice}, getAvailableQuantity: {item in return item.availableQuantity},onChipTapped: {} )
    }
}

