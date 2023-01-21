//
//  CartViewModel.swift
//  ToDoList
//
//  Created by Tedtya rady on 20/1/2023.
//

import Foundation
import Alamofire

class CartViewModel {
    
    @Published var checked: Bool = false
    @Published var quantity: Int = 0
    @Published var test: String = "0"
    @Published var loggedIn: Bool = false
    @Published var loginViewModel: LoginViewModel = .init()
    var isLoading = false
    @Published var user: User = User.dummUser
    
    
    func fetchUserCarts() {
        isLoading = true
        
        let url = "https://dummyjson.com/carts/user"
        let userID:Int = user.id
        let fetchCartURL = url + String(userID)
        
        AF.request(fetchCartURL)
            .responseDecodable(of: CartResponse.self) { response in
                
                defer {self.isLoading = false }
                guard response.value != nil else {
                    print("Error")
                    return
                }
                
                
                
                
                
            }
        
//        self.isLoading = false
        
    }
    
    
    
    
}
