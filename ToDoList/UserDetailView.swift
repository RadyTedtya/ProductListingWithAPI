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
    var arrayRows: [String] = [ "A", "B", "C"]

    
    
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




// MARK: - to view row dynamically
//enum userDetailRows: String, Equatable, CaseIterable {
//    case name, email, dob, gender, phone
//        switch self {
//            case .name:
//                return self.loginViewModel.user.firstName! + " " + self.loginViewModel.user.lastName
//            case .email:
//                return self.loginViewModel.email
//            case .dob:
//                return $loginViewModel.user.birthDate
//            case .gender:
//                return $loginViewModel.user.gender
//            case .phone:
//                return $loginViewModel.user.phone
//            }
//}






//
//var body: some View {
//    NavigationView {
//        VStack(alignment: .leading) {
//            VStack(alignment: .center) {
//                KFImage(URL(string: loginViewModel.user.image ?? "person.crop.circle.fill"))
//                Text(loginViewModel.username)
//
//                ForEach(Array(arrayRows.enumerated()), id: \.offset) { index, row in
//                    Text(row)
//                }
//
//
//                }
//            }
//
//        }
//    }
//
//}




//                HStack {
//                    Text("Name")
//                        .padding(.trailing)
//                    Text(loginViewModel.user.firstName! + " " + loginViewModel.user.lastName)
//                }
//                HStack {
//                    Text("Email")
//                        .padding(.trailing)
//                    Text(loginViewModel.email)
//                }
//                HStack {
//                    Text("DoB")
//                        .padding(.trailing)
//                    Text(loginViewModel.user.birthDate)
//                }
//                HStack {
//                    Text("Gender")
//                        .padding(.trailing)
//                    Text(loginViewModel.user.gender)
//                }
//                HStack {
//                    Text("Phone")
//                        .padding(.trailing)
//                    Text(loginViewModel.user.phone)
//                }
