//
//  ProductDetailView.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    @State var product: Product = Product.dummyProduct
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    KFImage(URL(string: product.images![0]))
                        .resizable()
                        .frame(height: 280)
                        .padding(.top, 50)
                                        
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text(product.title)
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                        }
                        Spacer()
                        HStack {
                            Text(String(product.price))
                            Text(String(product.discountPercentage ?? 0.0))
                            Spacer()
                            Image(systemName: "star")
                            Text(String(product.rating ?? 0.0))
                        }
                        
                    }
                    .padding()
                    .frame(width: 300, height: 90)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: Color.gray.opacity(0.6), radius: 10, x: 0, y: 0)
                    .padding(.bottom)
                    
                    Spacer()
                    
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
                        Text(product.description ?? "")
                            .multilineTextAlignment(.center)
                            .frame(maxHeight: .infinity)
                        
                        HStack() {
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
        .navigationTitle("Product Detail")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
