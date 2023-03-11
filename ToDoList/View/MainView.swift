//
//  ContentView.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//
import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: ContentViewModel = .init()
    @ObservedObject var loginViewModel: LoginViewModel = .init()
    
    
    var body: some View {
        
        TabView {
            HomeView(viewModel: viewModel, loginViewModel: loginViewModel)
                .tabItem {
                    Image(systemName: "house")
                }
            
            CategoryView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                }
            
            FavouriteView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "heart")
                }
            
            SettingView(loginViewModel:  loginViewModel)
                .tabItem {
                    Image(systemName: "list.bullet")
                }
        }
        .accentColor(Color.tertiaryBackground)
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(Color.primaryColor)
            
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
