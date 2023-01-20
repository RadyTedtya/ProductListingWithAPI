//
//  LoginViewModel.swift
//
//
//  Created by Tedtya rady on 19/1/2023.
//

import Foundation
import Alamofire

struct UserLoginRequest: Encodable {
    let username: String
    let password: String
}


struct UserSignUpRequest: Encodable {
    let username: String
    let password: String
    let DoB: String
}


class LoginViewModel: ObservableObject {
    
    @Published var loginSuccess = false
    @Published var username: String = "kminchelle"
    @Published var password: String = "0lelplR"
    @Published var DoB: String = "12 Jan 1999"
    @Published var isLoading: Bool = false
    @Published var user: User = User.dummUser
    
    
    
    func login() {
        isLoading = true
        let loginURL = "https://dummyjson.com/auth/login"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        AF.request(loginURL, method: .post, parameters: UserLoginRequest(username: username, password: password), encoder: .json, headers: header)
            .responseDecodable(of: UserResponse.self) { response in
                
                defer { self.isLoading = false }
                guard response.value != nil else {
                    print("error")
                    return
                }
                print(response.value!)
                if !(response.value?.token.isEmpty ?? false) {
                    self.loginSuccess = true
                    print("Login success")
                }
            }
    }

    
    func signUp() {
        isLoading = true
        let signUpURL = "https://dummyjson.com/users/add"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        

        
        AF.request(signUpURL, method: .post, parameters: UserSignUpRequest(username: username, password: password, DoB: DoB), encoder: .json, headers: header)
            .responseDecodable(of: UserResponse.self) { response in
                defer { self.isLoading = false }
                guard response.value != nil else {
                    print("error")
                    return
                }


                
                    if response.value?.id != nil {
                    print("Sign up success")
                } else {
                    print("Sign up failed")
                }
            }
    }
}
