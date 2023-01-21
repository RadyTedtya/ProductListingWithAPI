//
//  Cart.swift
//  ToDoList
//
//  Created by Tedtya rady on 21/1/2023.
//

import Foundation

struct CartResponse: Decodable {
    var id: Int
    var products: [Product]?
}
