//
//  CartViewModel.swift
//  ToDoList
//
//  Created by Tedtya rady on 20/1/2023.
//

import Foundation
import Alamofire

class CartViewModel: ObservableObject {
    
    @Published var checked: Bool = false
    @Published var test: String = "0"
    @Published var loggedIn: Bool = false
    @Published var loginViewModel: LoginViewModel = .init()
    @Published var isLoading = false
    @Published var products: [Product] = []
    @Published var carts: [Cart] = []
    
    
    func fetchUserCarts() {
        isLoading = true
        
        let url = "https://dummyjson.com/carts/user/"
        let userID:Int = loginViewModel.user.id
        let fetchCartURL = url + String(userID)
        
        AF.request(fetchCartURL)
            .responseDecodable(of: CartResponse.self) { cartResponse in
                
                defer {self.isLoading = false
                    print("Number of carts: " + String(self.carts.count))
                }
                
                if cartResponse.value != nil {
                    print("fetched cart success")
                    self.carts.append(contentsOf: cartResponse.value?.carts ?? [])
                } else {
                    print("Error")
                }
                
            }
        
    }
    
    
    
    
}
