//
//  UserDetailView.swift
//  ToDoList
//
//  Created by Tedtya rady on 6/2/2023.
//

import Foundation
import SwiftUI

struct UserDetailView:View {
    
    @State var loginViewModel: LoginViewModel
    
    var body: some View {
        Text("User Detail View")
        Button {
            print(loginViewModel.loginResult.rawValue)
        } label: {
            Text("Print")
        }
    }
}
