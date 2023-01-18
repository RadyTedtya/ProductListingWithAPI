//
//  ContentView.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "house")
                }
            CategoryView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                }
            
            HomeView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "heart")
                }
            HomeView(viewModel: viewModel)
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
