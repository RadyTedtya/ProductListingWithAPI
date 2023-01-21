//
//  SignUpView.swift
//  ToDoList
//
//  Created by Tedtya rady on 19/1/2023.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
//    @State var username: String = ""
//    @State var email: String = ""
//    @State var password: String = ""
    @ObservedObject var viewModel: LoginViewModel = .init()
    @State private var showingAlert = false
    
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(systemName: "square.stack.3d.up")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.white)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Create account")
                    .font(.system(size: 23))
                Text("Hello there, please sign in to continue")
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    Text("Username")
                        .font(.system(size: 17, weight: .bold))
                    
                    TextField(
                      "Username",
                      text:$viewModel.username
                    )
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Email or Phone Number")
                        .font(.system(size: 17, weight: .bold))
                    
                    TextField(
                      "Username/Email",
                      text: $viewModel.email
                    )
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Password")

                        .font(.system(size: 17, weight: .bold))
                    
                    TextField(
                      "Password",
                      text: $viewModel.password
                    )
                }
                .padding()
                
                Button {
                    viewModel.login()
                    showingAlert = true
                } label: {
                    Text("Sign Up")
                        .padding()
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(loginResult()))
                }


                HStack(alignment: .center) {
                    Text("Already have an account?")
                        .font(.system(size: 12))
                    NavigationLink {
                        
                    } label: {
                        Text("Sign in")
                            .font(.system(size: 12, weight: .bold))
                    }
                }
                .padding(.top)
                
            }
            .padding()
            .background(Color.secondaryBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .foregroundColor(Color.tertiaryBackground)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.tertiaryBackground)
    }
    
    func loginResult() -> String {
        if viewModel.loginSuccess {
            return "Login success"
        } else {
            return "Login failed"
        }
    }
    
}

struct SignUpView_Preview: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
