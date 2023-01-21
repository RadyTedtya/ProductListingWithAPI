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
    @Published var email: String = "0lelplR"
    @Published var DoB: String = "12 Jan 1999"
    @Published var isLoading: Bool = false
    @Published var user: User = User.dummUser
    
    
    
//    typealias MyCompletion = (_ result: Bool, _ second: Int) -> Void
//
//    func test(completion: @escaping MyCompletion) {
//        DispatchQueue.global(qos: .background).async {
//            completion(false, 12)
//            print("1")
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                completion(true, 2)
//            }
//            print("2")
//        }
//    }
//
//    func login() {
//        print("3")
//        test { result, second in
//            if result {
//                print("I ('m here now)")
//            } else {
//                print("H (ello there)")
//            }
//
//        }
//        print("4")
// 3 1 2 4 I H
        
        
    func login() {
        isLoading = true
        let loginURL = "https://dummyjson.com/auth/login"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        print("test Defer1")

        AF.request(loginURL, method: .post, parameters: UserLoginRequest(username: username, password: password), encoder: .json, headers: header)
            .responseDecodable(of: UserResponse.self) { response in
                print("test Defer 2")

                defer { self.isLoading = false
                    print("test Defer 3") }

                guard response.value != nil else {
                    print("error")

                    return
                }
                print(response.value!)
                if !(response.value?.token.isEmpty ?? false) {
                    self.loginSuccess = true
                }
            }

        print("test Defer 4")
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
