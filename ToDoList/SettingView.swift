//
//  SettingView.swift
//  ToDoList
//
//  Created by Tedtya rady on 19/1/2023.
//

import Foundation
import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 5) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width:50 ,height: 50)
                    
                    Text("Username")
                    Spacer()
                    NavigationLink {
                        SignInView()
                    } label: {
                        Text("Sign in")
                    }
                    Spacer()
                    NavigationLink {
                        SignInView()
                    } label: {
                        Text("Sing up")
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}


struct SettingView_Preview: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
