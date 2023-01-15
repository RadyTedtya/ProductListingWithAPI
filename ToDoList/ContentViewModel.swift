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
    private var _hasMoreItem: Bool = false
    var page : Int = 0
    
    
    func loadMoreContent(currentIndex index: Int){
        if _hasMoreItem, index == (products?.count ?? 0) - 1 {
            page += 1
            fetchProductsPagination()
        }
    }
    
    func fetchProductsPagination() {
        isLoading = true
        AF.request("https://dummyjson.com/products?limit=10&skip=\(page*10)")
            .responseDecodable(of: ProductResponse.self) { response in
                defer { self.isLoading = false }
                guard response.value != nil else {
//                guard response.value != nil else {
                    print("error")
                    return
                }
                
                if self.products == nil {
                    self.products = []
                }
                self.products?.append(contentsOf: response.value!.products)
                self._hasMoreItem = response.value!.total != self.products!.count
            }
        
        
    }
    
        func fetchSearchedProducts() {
            AF.request("https://dummyjson.com/products/search?q=phone")

        }
    
}
