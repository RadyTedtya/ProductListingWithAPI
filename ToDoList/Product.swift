//
//  Product.swift
//  
//
//  Created by Tedtya rady on 10/1/23.
//

import Foundation

struct ProductResponse: Decodable {
    var products: [Product]
    let skip: Int
    let limit: Int
    let total: Int
}

struct CategoryResponse: Decodable {
    var category: [String]
}

struct Product: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String?
    let price: Double
    let discountPercentage: Double?
    let rating: Double?
    let images: [String]?
    let category: String?
    
    
    static let dummyImages: [String] = [
        "https://i.dummyjson.com/data/products/12/1.jpg",
        "https://i.dummyjson.com/data/products/12/2.jpg",
        "https://i.dummyjson.com/data/products/12/3.png",
        "https://i.dummyjson.com/data/products/12/4.jpg",
        "https://i.dummyjson.com/data/products/12/thumbnail.jpg"]
    
    
    static let dummyProduct: Product = .init(id: 0, title: "iPhone  XS", description: "This is an Iphone XS MAX", price: 400, discountPercentage: 250, rating: 4.2, images: dummyImages, category: "smartphone")
}


