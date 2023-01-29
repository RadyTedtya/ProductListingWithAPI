//
//  ContentView.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = .init()
    //    @State private var selectedTabItem: Int = 0
    
    private enum Tab {
        case First, Second, Third, Forth
    }
    
    var body: some View {
        
        TabView() {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "house")
                }.onAppear{
                    viewModel.resetProducts()
                    viewModel.fetchProductsPagination()
                    print("0")
                }
            
            CategoryView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                }.onAppear{
                    viewModel.resetCategories()
                    viewModel.fetchProductsPagination()
                    print("1")
                }
            
            
            FavouriteView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "heart")
                }.onAppear{
                    print(0)
                }
            
            SettingView()
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
        ContentView()
    }
}
