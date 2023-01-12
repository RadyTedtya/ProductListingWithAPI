//
//  ProductDetailView.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//

import SwiftUI

struct ProductDetailView: View {
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                
                Image("iphone")
                    .resizable()
                    .frame(width: 80, height: 200)
                    
                
                VStack {
                    
                }
                .frame(width: 500, height: 500)
                .background(Color.yellow)
                
            }.frame(maxWidth: .infinity)
            VStack {
                
            }
            .frame(width: 500, height: 200)
            .background()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
