//
//  SubCategoryView.swift
//  ToDoList
//
//  Created by Tedtya rady on 18/1/2023.
//

import Foundation
import SwiftUI

struct SubCategoryView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    @State var selectedCategory: String = ""
    let column = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: column) {
                    ForEach(Array(viewModel.products!.enumerated()), id: \.offset) { index, product in
                        NavigationLink {
                            ProductDetailView(product: product, viewModel: viewModel)
                        } label: {
                            ProductCardView(product: product, viewModel: viewModel)
                        }
                        .onAppear {
                            viewModel.loadMoreContent(currentIndex: index)
                        }
                    }
                }
            }
            
        }
        .navigationBarTitle(viewModel.selectedCategory.capitalized, displayMode: .inline)
        .onAppear {
            viewModel.resetProducts()
            viewModel.selectedCategory = self.selectedCategory
            viewModel.fetchProductsPagination()
        }
    }
    
}

