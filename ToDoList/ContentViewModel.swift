//
//  ContentViewModel.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//

import Alamofire
import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var products: [Product]? = nil
    @Published var isLoading: Bool = false
//    @Published var searchText: String = ""
    
    func fetchProducts() {
        isLoading = true
        AF.request("https://dummyjson.com/products")
            .responseDecodable(of: ProductResponse.self) { response in
                defer { self.isLoading = false }
                guard let data = response.value else {
                    print("error")
                    return
                }
                self.products = data.products
            }
    }
    
    
    func fetchSearchedProducts() {
        
        AF.request("https://dummyjson.com/products/search?q=phone")
        
    }
    
}
