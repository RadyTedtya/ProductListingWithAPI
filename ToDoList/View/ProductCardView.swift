//
//  ProductCardView.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//

import SwiftUI
import Kingfisher

struct ProductCardView: View {
    
    var product: Product
    @ObservedObject var viewModel: ContentViewModel
    @State var isLiked: Bool = false
    @State var likedImage: String = "heart.filled"
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .top) {
                product.images?.count ?? 0 > 0 ? AnyView(KFImage(URL(string: product.images![0]))
                    .resizable()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 180))
                : AnyView(Image("iphone")
                    .resizable()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 180))
                
                Button {
                    viewModel.addFavouriteProducts(product: product)
                    if !isLiked {
                        isLiked = true
                    } else {
                        isLiked = false
                    }
                } label: {
                    heartImage()
                }
                .offset(x:60, y: -15)
                
            }
            .frame(width: 150, height: 210, alignment: .trailing)
            
            Text(product.title)
                .foregroundColor(Color.primaryTextColor)
                .font(.system(size: 18, weight: .bold))
            
            
            
            HStack {
                Text("$"+String(product.price))
                    .foregroundColor(Color.black)
                    .font(.system(size: 11.5))
                
                Text("$"+String(product.discountPercentage ?? 0.0))
                    .foregroundColor(Color.red)
                    .font(.system(size: 10.5))
                
                Spacer()
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(Color.tertiaryBackground)
                Text(String(product.rating ?? 0.0))
                    .foregroundColor(Color.black)
                    .font(.system(size: 10.5))
            }
        }
        .foregroundColor(Color.tertiaryBackground)
        .padding()
        .frame(width: 170, height: 300)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .padding()
    }
    
    
    func heartImage() -> Image {
        if !isLiked {
            return Image(systemName: "heart")
        } else {
            return Image(systemName: "heart.fill")
        }
    }
}



