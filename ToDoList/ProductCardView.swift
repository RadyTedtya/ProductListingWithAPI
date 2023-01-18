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
                    print("Liked")
                } label: {
                    Image(systemName: "heart")
                        .foregroundColor(Color.primary)
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
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 12, height: 12)
                Text(String(product.rating ?? 0.0))
                    .foregroundColor(Color.black)
                    .font(.system(size: 10.5))
                
            }
        }
        .padding()
        .frame(width: 170, height: 300)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .padding()
    }
}


struct ProductCardView_Preview: PreviewProvider {
    static var previews: some View{
        ProductCardView(product: Product.dummyProduct)
    }
}
