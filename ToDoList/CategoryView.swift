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
                            SubCategoryView(viewModel: viewModel)
                                .onAppear {
                                    viewModel.resetProducts()
                                    viewModel.category = category
                                }
                        } label: {
                            Text(category.capitalized)
                                .font(.system(size: 15))
                                .foregroundColor(Color.black)
                        }
                    }
                }
                .background(Color.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    viewModel.resetCategories()
                    viewModel.resetProducts()
                    viewModel.fetchCategories()
                }
            }
            .navigationTitle("Product Categories")
        }
        
    }
}


struct CategoryView_Preview: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
