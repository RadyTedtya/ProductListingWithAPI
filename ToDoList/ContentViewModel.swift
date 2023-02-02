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
    @Published var categories: [String]? = []
    @Published var selectedCategory: String = ""
    @Published var users: [User]? = nil
    @Published var selectedDisplayType: DisplayProductType = .all
    @Published var favouriteProducts: [Product] = .init()
    
    
    
    private var _hasMoreItem: Bool = false
    var page : Int = 0
    
    func loadMoreContent(currentIndex index: Int){
        if _hasMoreItem, index == (products?.count ?? 0) - 1 {
            page += 1
            fetchProductsPagination()
        }
    }
    

//  MARK:   API fetch to:
//          - load all products
//          - load search product
//          - load category products
//          with pagination
    func fetchProductsPagination() {
        isLoading = true
        var fetchString  = "https://dummyjson.com/products"
        var query = "limit=10&skip=\(page*10)"
        if !searchText.isEmpty {
            fetchString += "/search"
            query += "&q=\(searchText)"
        }
        else if !selectedCategory.isEmpty {
            fetchString += "/category/\(selectedCategory)?"
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
    
//    func resetCategories() {
//        selectedCategory = ""
//    }

    func fetchCategories() {
        isLoading = true
        let fetchCategoryQuery = "https://dummyjson.com/products/categories"
        AF.request(fetchCategoryQuery)
            .responseDecodable(of: [String].self) { cateResponse in
                defer { self.isLoading = false }
                guard cateResponse.value != nil else {
                    print("error")
                    return
                }
                if self.categories == nil {
                    self.categories = []
                }
                if self.categories != []{
                    return
                }
                self.categories?.append(contentsOf: cateResponse.value!)
                print(self.categories as Any)
            }
    }
    
    func addFavouriteProducts(product: Product) {
        if favouriteProducts.isEmpty {
            favouriteProducts = []
            favouriteProducts.append(product)
            return
        }
        if favouriteProducts.contains(where: {$0.id == product.id}){
            return
        } else {
            favouriteProducts.append(product)
        }
        print(favouriteProducts)
    }
    
}




//  MARK: - API URL
//  https://dummyjson.com/products
//  https://dummyjson.com/products/search?limit=10&skip=0&q=phone
//  https://dummyjson.com/products/category/smartphones?limit=10&skip=0
    


