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
    let column = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: column) {
                        ForEach(Array(viewModel.products!.enumerated()), id: \.offset) { index, product in
                            NavigationLink {
                                ProductDetailView(product: product)
                            } label: {
                                ProductCardView(product: product)
                                    .onAppear {
                                        viewModel.loadMoreContent(currentIndex: index)
                                    }
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchProductsPagination()
                }
            }
        }
        .navigationTitle(viewModel.category)
    }
}
