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
        List {
            ForEach(viewModel.productCategories!, id: \.self) { category in
                NavigationLink {
                } label: {
                    Text(category)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.fetchCategoryProducts()
        }
    }
    
}

struct CategoryView_Preview: PreviewProvider {
    static var previews: some View {
        CategoryView(viewModel: .init())
    }
}
