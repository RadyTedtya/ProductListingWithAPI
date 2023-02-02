//
//  FavoriteView.swift
//  ToDoList
//
//  Created by Tedtya rady on 27/1/2023.
//

import Foundation
import SwiftUI
import Kingfisher

struct FavouriteView: View {
    
    @ObservedObject var viewModel:ContentViewModel = .init()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
//                    ForEach(viewModel.products ?? [] ) { product in
//                        ProductRow(product: product, viewModel: viewModel)
//                    }
                    ForEach(viewModel.favouriteProducts) { product in
                        ProductRow(product: product, viewModel: viewModel)
                    }
                }
                .background(Color.white)
            }
            .navigationTitle("Favourite Products")
        }
        .onAppear() {
            viewModel.resetProducts()
        }
        
    }
    
}


struct ProductRow: View {
    
    @State var product: Product = Product.dummyProduct
    @ObservedObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        HStack {
            KFImage(URL(string: product.images![0]))
                .resizable()
                .frame(width: 100,height: 100)
            VStack {
                HStack {
                    Text(product.title)
                        .font(.system(size: 18, weight: .bold))
                    Spacer()
                    Button {
                        viewModel.addFavouriteProducts(product: product)
                    } label: {
                        Image(systemName: "heart")
                            .foregroundColor(Color.primary)
                    }
                    Button {
                        viewModel.addFavouriteProducts(product: product)
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(Color.primary)
                    }
                    
                }
                .padding(.bottom, 20)
                HStack {
                    Text("$"+String(product.price))
                    Text("$"+String(product.discountPercentage ?? 0.0))
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.secondaryColor)
                    Text(String(product.rating ?? 0.0))
                        .foregroundColor(Color.primary)
                }
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }
    
    
    
}




