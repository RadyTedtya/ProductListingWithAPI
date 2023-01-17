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
    @Published var searchproducts: [Product]? = nil
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    @Published var productCategory: [String] = []
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
        var fetchString  = "https://dummyjson.com/products"
        var query = "limit=10&skip=\(page*10)"
        if !searchText.isEmpty {
            fetchString += "/search"
            query += "&q=\(searchText)"
        }
        fetchString += "?\(query)"
        print(fetchString)
        AF.request(fetchString)
            .responseDecodable(of: ProductResponse.self) { response in
                defer { self.isLoading = false }
                guard response.value != nil else {
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
    
    func resetProducts() {
        products = []
        page = 0
    }

//    func fetchCategoryProducts() {
//        isLoading = true
//        let fetchCategoryQuery = "https://dummyjson.com/products/categories"
//        AF.request(fetchCategoryQuery)
//            .responseDecodable(of: CategoryResponse.self) { response in
//                defer { self.isLoading = false }
//                guard response.value != nil else {
//                    print("error")
//                    return
//                }
//                
//                if self.productCategory == nil {
//                    self.productCategory = []
//                }
////                self.productCategory.append(contentsOf: response.value!)
//                
//            }
//        
//    }
    
    
}

