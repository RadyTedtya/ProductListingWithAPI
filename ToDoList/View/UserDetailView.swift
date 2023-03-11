//
//  UserDetailView.swift
//  ToDoList
//
//  Created by Tedtya rady on 6/2/2023.
//

import Foundation
import SwiftUI
import Kingfisher

struct UserDetailView:View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    KFImage(URL(string: loginViewModel.user.image ?? "person.crop.circle.fill"))
                        .frame(width: 50, height: 50)
                    Spacer()
                    Text(loginViewModel.username)
                        .font(.system(size: 19))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                .padding()
                
                HStack {
                    VStack(spacing: 10) {
                        Text("Name")
                        Text("Email")
                        Text("DoB")
                        Text("Gender")
                        Text("Phone")
                    }
                    .padding()
                    .padding(.trailing, 30)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(loginViewModel.user.firstName! + " " + loginViewModel.user.lastName)
                        Text(loginViewModel.email)
                        Text(loginViewModel.user.birthDate)
                        Text(loginViewModel.user.gender)
                        Text(loginViewModel.user.phone)
                    }
                }
                
                Spacer()
            }
            .padding()
            
        }
    }
    
}


