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
            
            
            FavoriteView()
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
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/*
 //  ContentView.swift
 //  ToDoList
 //
 //  Created by Tedtya rady on 10/1/23.
 //
 
 import SwiftUI
 
 struct ContentView: View {
 @ObservedObject var viewModel: ContentViewModel = .init()
 @State private var selectedTabItem: Tab = Tab.First
 
 private enum Tab {
 case First, Second, Third, Forth
 }
 
 var body: some View {
 
 TabView(selection: $selectedTabItem) {
 HomeView(viewModel: viewModel)
 .onTapGesture {
 selectedTabItem = Tab.First
 }
 .tabItem {
 Image(systemName: "house")
 }.tag(Tab.First)
 
 
 CategoryView(viewModel: viewModel)
 .onTapGesture {
 selectedTabItem = Tab.Second
 }
 .tabItem {
 Image(systemName: "square.grid.2x2")
 }.tag(Tab.Second)
 
 
 HomeView(viewModel: viewModel)
 .onTapGesture {
 selectedTabItem = Tab.Third
 }
 .tabItem {
 Image(systemName: "heart")
 }.tag(Tab.Third)
 
 SettingView()
 .onTapGesture {
 selectedTabItem = Tab.Forth
 }
 .tabItem {
 Image(systemName: "list.bullet")
 }.tag(Tab.Forth)
 }
 
 
 
 
 }
 }
 
 struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }
 
 */
