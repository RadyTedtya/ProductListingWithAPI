//
//  AboutView.swift
//  ToDoList
//
//  Created by Tedtya rady on 29/1/2023.
//

import Foundation
import SwiftUI

struct AboutView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("ToDoList Limited is the leading global platform for the luxury fashion industry. Our mission is to be the global platform for luxury fashion, connecting creators, curators and consumers. Founded in 2007 by José Neves for the love of fashion, and launched in 2008, ToDoList began as an e-commerce marketplace for luxury boutiques around the world. Today the ToDoList Marketplace connects customers in over 190 countries and territories with items from more than 50 countries and over 1,400 of the world’s best brands, boutiques and department stores, delivering a truly unique shopping experience and access to the most extensive selection of luxury on a single platform.")
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Text("ToDoList’s additional businesses include Browns and Stadium Goods, which offer luxury products to consumers, and New Guards Group, a platform for the development of global fashion brands. ToDoList offers its broad range of consumer-facing channels and enterprise level solutions to the luxury industry under its Luxury New Retail initiative. The Luxury New Retail initiative also encompasses ToDoList Platform Solutions, which services enterprise clients with e-commerce and technology capabilities, and in-store innovations such as the ToDoList Connected Retail suite of technology products.")
                        .multilineTextAlignment(.center)
                    
                }
                .padding()
                .padding()
                .navigationBarTitle("About Us", displayMode: .inline)
            }
        }
    }
}

