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

class LoginViewModel: ObservableObject {
    
    
    @Published var username: String = "kminchelle"
    @Published var password: String = "0lelplR"
//    @Published var password: String = "0lelplRasdfasdf"
    @Published var email: String = "kminchelle@gmail.com"
    @Published var isLoading: Bool = false
    @Published var user: User = User.dummUser
    
    
    func login(loginClosure: @escaping () -> ()) {
        self.isLoading = true
        let loginURL = "https://dummyjson.com/auth/login"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        AF.request(loginURL, method: .post, parameters: UserLoginRequest(username: username, password: password), encoder: .json, headers: header)
            .responseDecodable(of: LoginResponse.self) { response in
                defer { self.isLoading = false; loginClosure() }
                if response.value?.token != nil {
                    Singleton.shared.loginSuccess = true
                    print("Login success")
                } else {
                    Singleton.shared.loginSuccess = false
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
                    Singleton.shared.signUpSuccess = true
                    print("Sign up success")
                } else {
                    Singleton.shared.signUpSuccess = false
                    print("Sign up failed")
                }
            }
    }
    
    
    
    
    
    
    
    
}


