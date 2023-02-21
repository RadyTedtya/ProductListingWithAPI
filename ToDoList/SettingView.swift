//
//  SettingView.swift
//  ToDoList
//
//  Created by Tedtya rady on 19/1/2023.
//

import Foundation
import SwiftUI
import Kingfisher

enum SettingType: String, CaseIterable, Identifiable {
    
    case userDetail = "User Detail"
    case signUp = "Sign Up"
    case loggin = "Log in"
    case about = "About"
    case terms = "Terms and Conditions"
    
    var id: Self {
        return self
    }
    
    func makeView(loginViewModel: LoginViewModel? = nil) -> any View {
        switch self {
        case .userDetail:
            if loginViewModel?.loginResult == .success {
                return UserDetailView(loginViewModel: loginViewModel!)
            } else {
                return SignInView(loginViewModel:  loginViewModel!)
            }
        case .signUp:
            return SignUpView()
        case .loggin:
            return SignInView(loginViewModel: loginViewModel!)
        case .about:
            return AboutView()
        case .terms:
            return TermsView()
        }
    }
    
}


struct SettingView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    private let _dataSource: [SettingType] = SettingType.allCases
    //    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView() {
            VStack(alignment: .leading){
                KFImage(URL(string: loginViewModel.user.image ?? "person.crop.circle.fill"))
                    .resizable()
                    .frame(width:50 ,height: 50)
                    .padding(.bottom)
                    .padding(.leading)
                Text(loginViewModel.username)
                    .padding(.leading)
                
                List {
                    ForEach(_dataSource) { row in
                        NavigationLink {
                            AnyView(row.makeView(loginViewModel: loginViewModel))
                        } label: {
                            Text(row.rawValue)
                                .font(.system(size: 18))
                                .foregroundColor(Color.black)
                        }
                    }
                    .navigationBarTitle("Setting", displayMode: .inline)
                }
                
                Spacer()
                
                Button {
                    loginViewModel.loginResult = .loading
                    print("Signed Out")
                } label: {
                    Text("Sign Out")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color.secondaryColor)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                }
            }
        }
    }
    
    
}


















