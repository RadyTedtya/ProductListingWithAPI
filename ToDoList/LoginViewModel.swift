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
    
    
    @Published var loginResult: LoginResultType = .loading
//    @Published var username: String = "kminchelle"
    @Published var username: String = "kminchell"
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
    
    
    
    
    func signUp() {
        isLoading = true
        let signUpURL = "https://dummyjson.com/users/add"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        
        
        AF.request(signUpURL, method: .post, parameters: UserSignUpRequest(username: username, password: password, DoB: DoB), encoder: .json, headers: header)
            .responseDecodable(of: LoginResponse.self) { response in
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
    
    

    
}

enum LoginResultType: String {
    case success, failure, loading
}

