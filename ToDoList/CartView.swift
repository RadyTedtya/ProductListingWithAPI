//
//  CartCardView.swift
//  ToDoList
//
//  Created by Tedtya rady on 20/1/2023.
//

import Foundation
import SwiftUI

struct CartView: View {
    
    var body: some View {
        VStack {
            CartCardView()
                .navigationTitle("Carts")
        }
    }
}


struct CartCardView: View  {
    
    @State var viewModel: CartViewModel = .init()
    @State var quantity: Int = 0
    
    var body: some View {
        
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
                                text: $viewModel.test
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
        
        
    }
    
    
}


struct CartCardView_Preview: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
