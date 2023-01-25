//
//  Cart.swift
//  ToDoList
//
//  Created by Tedtya rady on 21/1/2023.
//

import Foundation

struct CartResponse: Decodable {
    var carts: [Cart]
    var total: Int
    var skip: Int
    var limit: Int
}


struct Cart: Decodable, Identifiable {
    
    var id: Int
    var products: [Product]
    var total: Double
    var discountedTotal: Double
    var userId: Int
    var totalProducts: Int
    var totalQuanity: Int
    
}
