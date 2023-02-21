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
    let email: String
}


enum LoginResultType: String {
    case success, failure, loading
}

class LoginViewModel: ObservableObject {
    
    @Published var loginResult: LoginResultType = .loading
    @Published var signUpResult: LoginResultType = .loading
    @Published var username: String = "kminchelle"
    @Published var password: String = "0lelplR"
    //    @Published var username: String = ""
    //    @Published var password: String = ""
    @Published var email: String = "0lelplR"
    @Published var isLoading: Bool = false
    @Published var user: User = User.dummUser
    
    
    func login() {
        isLoading = true
        let loginURL = "https://dummyjson.com/auth/login"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        AF.request(loginURL, method: .post, parameters: UserLoginRequest(username: username, password: password), encoder: .json, headers: header)
            .responseDecodable(of: LoginResponse.self) { response in
                defer { self.isLoading = false }
                if response.value?.token != nil {
                    self.loginResult = .success
                    print("Login success")
                } else {
                    self.loginResult = .failure
                    print("Login fail")
                }
            }
    }
    
    
    func signUp() {
        isLoading = true
        let signUpURL = "https://dummyjson.com/users/add"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        
        AF.request(signUpURL, method: .post, parameters: UserSignUpRequest(username: username, password: password, email: email), encoder: .json, headers: header)
            .responseDecodable(of: LoginResponse.self) { response in
                defer { self.isLoading = false }
                guard response.value != nil else {
                    print("error")
                    return
                }
                
                if response.value?.id != nil {
                    self.signUpResult = .success
                    print("Sign up success")
                } else {
                    self.signUpResult = .failure
                    print("Sign up failed")
                }
            }
    }
    
    
    
    
    
    
}


