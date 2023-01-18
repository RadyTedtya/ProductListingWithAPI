//
//  CategoryView.swift
//  ToDoList
//
//  Created by Tedtya rady on 17/1/2023.
//

import Foundation
import SwiftUI

struct CategoryView: View {
    
    @ObservedObject var viewModel: ContentViewModel = .init()

    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.categories!, id: \.self) { category in
                    NavigationLink {
                        SubCategoryView(viewModel: viewModel)
                            .onAppear {
                                viewModel.resetProducts()
                                viewModel.category = category
                            }
                    } label: {
                        Text(category)
                            .font(.system(size: 15))
                            .foregroundColor(Color.black)
                            
                    }
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                viewModel.resetProducts()
                viewModel.fetchCategories()
            }
            
        }
        .navigationTitle("Product Categories")
    }
}
