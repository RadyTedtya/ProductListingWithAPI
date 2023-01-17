//
//  ContentView.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//

import SwiftUI

struct ApiDataTesting: View {
    
    @ObservedObject var viewModel: ContentViewModel = .init()
    @State var searchText: String = ""
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            if !(viewModel.products ?? []).isEmpty {
                ScrollView(.vertical) {
                    VStack {
                        LazyVGrid(columns: columns) {
//                            if searchText.isEmpty {
//                                ForEach(Array(viewModel.products!.enumerated()), id: \.offset) { index, product in
//                                    NavigationLink {
//                                        ProductDetailView(product: product)
//                                    } label: {
//                                        ProductCardView(product: product)
//                                            .onAppear {
//                                                viewModel.loadMoreContent(currentIndex: index)
//                                            }
//                                    }
//                                }
//                            }else {
//                                ForEach(Array(viewModel.products!.enumerated()), id: \.offset) { index, product in
//                                    NavigationLink {
//                                        ProductDetailView(product: product)
//                                    } label: {
//                                        ProductCardView(product: product)
//                                            .onAppear {
//                                                viewModel.fetchSearchedProducts()
//                                            }
//                                    }
//                                }
//                            }
                        }
                    }
                }
            }
        }
    }
    
}

struct ApiDataTesting_Previews: PreviewProvider {
    static var previews: some View {
        ApiDataTesting()
    }
}




/*
 MARK: - BODY
 var body: some View {
     
     NavigationView {
         ZStack(alignment: .center) {
             
             if viewModel.isLoading {
                 ProgressView("Loading")
             }
             
             /*
              viewModel.products ?? []
              MARK: - Explain:
              if viewModel.products == nil {
                  viewModel.products = []
              }
              */
             
             /*
              if !(viewModel.products ?? []).isEmpty {
                  
              }
              MARK: - Explain:
              if viewModel.products == nil {
                  viewModel.products = []
              }
              if !viewModel.products!.isEmpty {
                  
              }
              */
             
             
             if !(viewModel.products ?? []).isEmpty {
                 ScrollView(.vertical, showsIndicators: false) {
                     VStack {
                         ForEach(Array(viewModel.products!.enumerated()), id: \.offset) { index, product in
                             Text(product.title)
                                 .onAppear {
                                     viewModel.loadMoreContent(currentIndex: index)
                                 }
                         }
                     }
                 }
             }
         
             
             
             
         }
     }
     
 }
 */
