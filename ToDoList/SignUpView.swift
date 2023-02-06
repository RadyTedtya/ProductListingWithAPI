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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
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
                    Text("Create account")
                        .foregroundColor(Color.black)
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
                        .foregroundColor(Color.black)
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
                        Text("Email or Phone Number")
                            .font(.system(size: 17, weight: .bold))
                        
                        TextField(
                          "Username/Email",
                          text: $viewModel.email
                        )
                        .foregroundColor(Color.black)
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
                            .font(.system(size: 17, weight: .bold))
                        
                        SecureField(
                          "Password",
                          text: $viewModel.password
                        )
                        .foregroundColor(Color.black)
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
                        viewModel.signUp()
                    } label: {
                        Text("Sign Up")
                            .padding()
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(Color.tertiaryBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(viewModel.loginResult.rawValue))
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
            .onReceive(viewModel.$signUpResult) { result in
                if result == .success {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
    
}

struct SignUpView_Preview: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
