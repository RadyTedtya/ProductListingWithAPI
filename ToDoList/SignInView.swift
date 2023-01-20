//
//  SignInView.swift
//  ToDoList
//
//  Created by Tedtya rady on 19/1/2023.
//

import Foundation
import SwiftUI

struct SignInView: View {
    
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
                Text("Log in to your account")
                    .font(.system(size: 23))
                Text("Hello there, please log in to continue")
                    .foregroundColor(Color.gray)
                
                VStack(alignment: .leading) {
                    Text("Email or Phone Number")
                        .foregroundColor(Color.tertiaryBackground)
                        .font(.system(size: 17, weight: .bold))
                    
                    TextField(
                        "Username/Email",
                        text: $viewModel.username
                    )
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .foregroundColor(Color.tertiaryBackground)
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
                    Text("Log in")
                        .padding()
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.tertiaryBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(loginResult()))
                }
                
                Text("Forgot password")
                    .foregroundColor(Color.tertiaryBackground)
                    .padding(.top)
                
                HStack(alignment: .center) {
                    Text("Dont have an account?")
                        .foregroundColor(Color.tertiaryBackground)
                        .font(.system(size: 12))
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Sign up")
                            .foregroundColor(Color.tertiaryBackground)
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

struct SignInView_Preview: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}







