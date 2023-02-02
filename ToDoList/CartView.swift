//
//  CartCardView.swift
//  ToDoList
//
//  Created by Tedtya rady on 20/1/2023.
//

import Foundation
import SwiftUI
import Kingfisher

struct CartView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel = .init()
    @ObservedObject var cartViewModel: CartViewModel = .init()
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                ForEach(Array($cartViewModel.carts.enumerated()), id: \.offset) { index, cart in
                    CartCardView(cart: cart)
                }
            }
            .onAppear {
                cartViewModel.fetchUserCarts()
            }
        }
    }
}


struct CartCardView: View  {
    
    @Binding var cart: Cart
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ForEach(Array($cart.products.enumerated()), id: \.offset) { index, product in
                ProductsCart(product: product)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
            .padding()
        }
        .navigationTitle("Carts")
    }
        
}



struct ProductsCart: View {
    @Binding var product: Product
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .padding(.horizontal, 20)
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text("$ ")
                    Text(String(product.price))
                    HStack {
                        Button {
                            product.quantity!+=1
                        } label: {
                            Text("+")
                        }

                        TextField(
                            String(product.quantity!),
                            value: $product.quantity,
                            formatter: NumberFormatter.init()
                        )
                        .clipShape(RoundedRectangle(cornerRadius:40))
                        .multilineTextAlignment(.center)
                        .border(.gray, width: 1)
                        .frame(width: 33, height: 25)
                        .font(.system(size: 15))
                        
                        Button {
                            if product.quantity! <= 0 {
                                return
                            } else {
                                product.quantity!-=1
                            }
                            
                        } label: {
                            Text("-")
                        }
                    }
                    .frame(width: 100)
                }
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color.secondaryColor)
            }
        }
    }
}

struct ProductsCart_Preview: PreviewProvider {
    static var previews: some View {
        ProductsCart(product: .constant(Product.dummyProduct))
    }
}



/*
 
 // MARK: - Inside product cart
 VStack(alignment: .leading) {
     HStack {
         Image(systemName: "checkmark.circle")
         Image(systemName: "house")
         Text("Shop name")
     } .padding(.bottom)
     
     HStack {
         Image(systemName: "checkmark.circle")
         
         Image(systemName: "iphone")
             .resizable()
             .padding()
             .frame(width: 100, height: 100)
         
         VStack {
             Text("Test test test test test test test ")
                 .multilineTextAlignment(.leading)
             
             
         }
         
     }
 }
 .foregroundColor(Color.white)
 .padding()
 .background(Color.tertiaryBackground)
 .clipShape(RoundedRectangle(cornerRadius: 10))
 .padding()
 
 
 
 
 VStack(alignment: .leading) {
 HStack {
     Image(systemName: "checkmark.circle")
     Image(systemName: "house")
     Text("Shop name")
 } .padding(.bottom)
 
 HStack {
     Image(systemName: "checkmark.circle")
     
     Image(systemName: "iphone")
         .resizable()
         .padding()
         .frame(width: 100, height: 100)
     
     VStack {
         Text("Test test test test test test test ")
             .multilineTextAlignment(.leading)
         
         HStack {
             Text("$ ")
             
             Text("193.00")
             
             HStack {
                 Button {
                     print("-")
                 } label: {
                     Text("-")
                 }
                 
                 
                 TextField(
                     "Password",
                     text: $pw
                 )
                 .clipShape(RoundedRectangle(cornerRadius:40))
                 .multilineTextAlignment(.center)
                 .frame(width: 33, height: 25)
                 
                 .font(.system(size: 15))
                 .border(.white)
                 
                 Button {
                     print("+")
                 } label: {
                     Text("+")
                 }
             }
             .frame(width: 100)
         }
     }
     
 }
}
.foregroundColor(Color.white)
.padding()
.background(Color.tertiaryBackground)
.clipShape(RoundedRectangle(cornerRadius: 10))
.padding()VStack(alignment: .leading) {
 HStack {
     Image(systemName: "checkmark.circle")
     Image(systemName: "house")
     Text("Shop name")
 } .padding(.bottom)
 
 HStack {
     Image(systemName: "checkmark.circle")
     
     Image(systemName: "iphone")
         .resizable()
         .padding()
         .frame(width: 100, height: 100)
     
     VStack {
         Text("Test test test test test test test ")
             .multilineTextAlignment(.leading)
         
         HStack {
             Text("$ ")
             
             Text("193.00")
             
             HStack {
                 Button {
                     print("-")
                 } label: {
                     Text("-")
                 }
                 
                 
                 TextField(
                     "Password",
                     text: $pw
                 )
                 .clipShape(RoundedRectangle(cornerRadius:40))
                 .multilineTextAlignment(.center)
                 .frame(width: 33, height: 25)
                 
                 .font(.system(size: 15))
                 .border(.white)
                 
                 Button {
                     print("+")
                 } label: {
                     Text("+")
                 }
             }
             .frame(width: 100)
         }
     }
     
 }
}
.foregroundColor(Color.white)
.padding()
.background(Color.tertiaryBackground)
.clipShape(RoundedRectangle(cornerRadius: 10))
.padding()
 */
