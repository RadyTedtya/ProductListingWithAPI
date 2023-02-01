//
//  ContentView.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = .init()
    @State private var selectedTabItem = "One"
    
    
    var body: some View {
        
        TabView(selection: $selectedTabItem) {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "house")
                }.onTapGesture {
                    selectedTabItem = "One"
                }
            
            CategoryView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                }.onTapGesture {
                    selectedTabItem = "Two"
                }
            
            FavouriteView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "heart")
                }.onTapGesture {
                    selectedTabItem = "Three"
                }
            
            SettingView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }.onTapGesture {
                    selectedTabItem = "Four"
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
        ContentView()
    }
}
