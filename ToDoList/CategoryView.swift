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
            VStack {
                List {
                    ForEach(viewModel.categories!, id: \.self) { category in
                        NavigationLink {
                            SubCategoryView(viewModel: viewModel, selectedCategory: category)

                        } label: {
                            Text(category.capitalized)
                                .font(.system(size: 15))
                                .foregroundColor(Color.black)
                        }
                    }
                }

                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationTitle("Product Categories")
        }
        .onAppear {
            viewModel.resetProducts()
            viewModel.selectedCategory = ""
            viewModel.fetchCategories()
        }
    }
}


struct CategoryView_Preview: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
