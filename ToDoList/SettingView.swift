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
        
        
        VStack(alignment: .leading) {
            
            
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width:50 ,height: 50)
                .padding(.bottom)
            
            Text("Tedtya RADY")
            
            Spacer()
            
            
            List {
                VStack(alignment: .leading, spacing: 30) {
                    NavigationLink {
                        SignInView()
                    } label: {
                        Text("Log in")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                            .overlay(   Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray.opacity(0.2)),
                                        alignment: .bottom
                            )
                        
                    }
                    
                    NavigationLink {
                        SignInView()
                    } label: {
                        Text("Sign up")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                            .overlay(   Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray.opacity(0.2)),
                                        alignment: .bottom
                            )
                    }
                    
                    NavigationLink {
                        SignInView()
                    } label: {
                        Text("Notification")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                            .overlay(   Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray.opacity(0.2)),
                                        alignment: .bottom
                            )
                    }
                    
                    
                    NavigationLink {
                        SignInView()
                    } label: {
                        Text("Language")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                            .overlay(   Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray.opacity(0.2)),
                                        alignment: .bottom
                            )
                    }
                    
                    NavigationLink {
                        CartView()
                    } label: {
                        Text("Cart")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                            .overlay(   Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray.opacity(0.2)),
                                        alignment: .bottom
                            )
                    }
                    
                    
                    
                }
            }
            
        }
    }
}



struct SettingView_Preview: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
