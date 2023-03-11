//
//  SignInView.swift
//  ToDoList
//
//  Created by Tedtya rady on 19/1/2023.


import Foundation
import SwiftUI

struct SignInView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    @State private var showingAlert = false
    
    @Environment(\.presentationMode) var presentationMode
    
    init(loginViewModel: LoginViewModel, showingAlert: Bool = false) {
        self.loginViewModel = loginViewModel
        self.showingAlert = showingAlert
    }
    
    var body: some View {
        ZStack {
            if loginViewModel.isLoading {
                ZStack(alignment: .center) {
                    ProgressView()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.6).edgesIgnoringSafeArea(.all))
                .zIndex(1)
            }
            
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
                            text: $loginViewModel.username
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                        .overlay(   Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray.opacity(0.2)),
                                    alignment: .bottom
                        )
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .foregroundColor(Color.tertiaryBackground)
                            .font(.system(size: 17, weight: .bold))
                        
                        SecureField(
                            "Password",
                            text: $loginViewModel.password
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                        .overlay(   Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray.opacity(0.2)),
                                    alignment: .bottom
                        )
                    }
                    .padding()
                    
                    Button {
                        loginViewModel.login()
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
            
            .onReceive(loginViewModel.$loginResult) { result in
                if result == .success {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }        
    }
    
}








