//
//  Product.swift
//
//
//  Created by Tedtya rady on 10/1/23.
//

import Foundation
import SwiftUI


struct ProductResponse: Decodable {
    var products: [Product]
    let skip: Int
    let limit: Int
    let total: Int
}

struct CategoryResponse: Decodable {
    var categories: [String]
}

struct Product: Identifiable, Decodable {
    var id: Int
    var title: String
    var description: String?
    var price: Double
    var discountPercentage: Double?
    var rating: Double?
    var images: [String]?
    var category: String?
    var quantity: Int?
    var total: Double?
    
    
    static let dummyImages: [String] = [
        "https://i.dummyjson.com/data/products/12/1.jpg",
        "https://i.dummyjson.com/data/products/12/2.jpg",
        "https://i.dummyjson.com/data/products/12/3.png",
        "https://i.dummyjson.com/data/products/12/4.jpg",
        "https://i.dummyjson.com/data/products/12/thumbnail.jpg"]
    
    static let dummyProduct: Product = .init(id: 0, title: "iPhone  XS", description: "This is an Iphone XS MAX", price: 400, discountPercentage: 250, rating: 4.2, images: dummyImages, category: "smartphone", quantity: 4, total: 40.23)
}



enum DisplayProductType: String, CaseIterable, Identifiable {
    case all, trending, sale
    var id: Self {
        return self
    }
    
//    switch self{
//    case .all:
//        
//    }
    
//    switch self {
//    case .all:
//        viewModel.resetProducts()
//        viewModel.fetchProductsPagination()
//    case .trending:
//        viewModel.resetProducts()
//        viewModel.products = viewModel.products?.filter {$0.rating! > 4.0}
//    case .sale:
//        viewModel.resetProducts()
//        viewModel.products = viewModel.products?.filter {!String($0.discountPercentage!).isEmpty}
//    }
    
    
    
    
//    func filterProducts(viewModel: ContentViewModel){
//        switch self {
//        case .all:
//            viewModel.resetProducts()
//            viewModel.fetchProductsPagination()
//        case .trending:
//            viewModel.resetProducts()
//            viewModel.products = viewModel.products?.filter {$0.rating! > 4.0}
//        case .sale:
//            viewModel.resetProducts()
//            viewModel.products = viewModel.products?.filter {!String($0.discountPercentage!).isEmpty}
//        }
//    }
    
//    func filterProducts(viewModel: ContentViewModel) -> ContentViewModel {
//        switch self {
//        case .all:
//            viewModel.resetProducts()
//            viewModel.fetchProductsPagination()
//            return viewModel
//        case .trending:
//            viewModel.resetProducts()
//            viewModel.products = viewModel.products?.filter {$0.rating! > 4.0}
//            return viewModel
//        case .sale:
//            viewModel.resetProducts()
//            viewModel.products = viewModel.products?.filter {!String($0.discountPercentage!).isEmpty}
//            return viewModel
//        }
//    }
    
    
    
}

