//
//  ProductDetailView.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//

import SwiftUI

struct ProductDetailView: View {
    var body: some View {
        //        ZStack(alignment: .center) {
        //            VStack {
        //
        //                Image("iphone")
        //                    .resizable()
        //                    .frame(width: 80, height: 200)
        //
        //
        //                VStack {
        //
        //                }
        //                .frame(width: 500, height: 500)
        //                .background(Color.yellow)
        //
        //            }.frame(maxWidth: .infinity)
        //            VStack {
        //
        //            }
        //            .frame(width: 500, height: 200)
        //            .background()
        //
        //        }
        //        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .background(Color.red)
        //    }
        
            VStack {
                Image("iphone")
                    .resizable()
                    .frame(width: 150, height: 350)
                    .padding(.top, 50)
                
                VStack {
                    HStack {
                        Text(Product.dummyProduct.title)
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
                    }
                    Spacer()
                    HStack {
                        Text(String(Product.dummyProduct.price))
                        Text(String(Product.dummyProduct.discountPercentage ?? 0.0))
                        Spacer()
                        Image(systemName: "star")
                        Text(String(Product.dummyProduct.rating ?? 0.0))
                    }
                    
                }
                .padding()
                .frame(width: 300, height: 80)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.gray.opacity(0.6), radius: 10, x: 0, y: 0)
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Color")
                    HStack(spacing: 10) {
                        Image(systemName: "rectangle.roundedtop.fill")
                            .foregroundColor(Color.gray)
                        Image(systemName: "rectangle.roundedtop.fill")
                            .foregroundColor(Color.black)
                        Image(systemName: "rectangle.roundedtop.fill")
                            .foregroundColor(Color.red)
                        Image(systemName: "rectangle.roundedtop.fill")
                            .foregroundColor(Color.blue)
                        Image(systemName: "rectangle.roundedtop.fill")
                            .foregroundColor(Color.green)
                    }
                    
                    Spacer()
                    Text("Detail")
                    Text(Product.dummyProduct.description ?? "")
                    
                    HStack {
                        
                        Image(systemName: "heart.square.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.secondaryColor)
                        
                        
                        Button {
                            print("clicked")
                        } label: {
                            Text("Add to cart")
                                .foregroundColor(Color.white)
                                .frame(width: 200, height: 50)
                                .background(Color.secondaryColor)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                
                        }
                     
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.secondaryBackground)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .edgesIgnoringSafeArea(.bottom)
            }
        
    }
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
