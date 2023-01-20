//
//  SignUpView.swift
//  ToDoList
//
//  Created by Tedtya rady on 19/1/2023.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    
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
                        .foregroundColor(Color.tertiaryBackground)
                        .font(.system(size: 17, weight: .bold))
                    
                    TextField(
                      "Username",
                      text:$username
                    )
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Email or Phone Number")
                        .foregroundColor(Color.tertiaryBackground)
                        .font(.system(size: 17, weight: .bold))
                    
                    TextField(
                      "Username/Email",
                      text: $email
                    )
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .foregroundColor(Color.tertiaryBackground)
                        .font(.system(size: 17, weight: .bold))
                    
                    TextField(
                      "Password",
                      text: $password
                    )
                }
                .padding()
                
                NavigationLink {
//                    print("Sing in")
                } label: {
                    Text("Sing in")
                        .padding()
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.tertiaryBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                }


                HStack(alignment: .center) {
                    Text("Already have an account?")
                        .foregroundColor(Color.tertiaryBackground)
                        .font(.system(size: 12))
                    NavigationLink {
                        
                    } label: {
                        Text("Sign in")
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
    
}

struct SignUpView_Preview: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
