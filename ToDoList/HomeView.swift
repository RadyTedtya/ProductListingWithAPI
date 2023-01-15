//
//  HomeView.swift
//
//
//  Created by Tedtya rady on 10/1/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: ContentViewModel = .init()
    @ObservedObject var searchResults: ContentViewModel = .init()
    @State var searchText: String = ""
    @State var categories: [String] = ["Trending", "New", "Sale", "Most Sale", "For you"]
    
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(categories, id: \.self) { id in
                            Button {
                                print("clicked \(id)")
                            } label: {
                                Text(id)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(Color.secondaryColor)
                                    .padding()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Spacer()
                
                //                if !(viewModel.products ?? []).isEmpty {
                //                    ScrollView(.vertical) {
                //                        VStack {
                //                            LazyVGrid(columns: columns) {
                //                                ForEach(Array(viewModel.products!.enumerated()), id: \.offset) { index, product in
                //                                    ProductCardView(product: product)
                //                                        .onAppear {
                //                                            viewModel.loadMoreContent(currentIndex: index)
                //                                        }
                //                                }
                //                            }
                //                        }
                //                    }
                //                }
                //            }
                
                if !(viewModel.products ?? []).isEmpty {
                    ScrollView(.vertical) {
                        VStack {
                            LazyVGrid(columns: columns) {
                                if searchText.isEmpty {
                                    ForEach(Array(viewModel.products!.enumerated()), id: \.offset) { index, product in
                                        ProductCardView(product: product)
                                            .onAppear {
                                                viewModel.loadMoreContent(currentIndex: index)
                                            }
                                    }
                                }else {
                                    List(searchResults) { product in
                                        NavigationLink {
                                            ProductDetailView(product: product)
                                        } label: {
                                            Text(product.title)
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            .onAppear {
                viewModel.fetchProductsPagination()
            }
            .frame(maxWidth: .infinity)
            .background(Color.primaryBackground)
            .navigationBarItems(trailing:
                                    Image(systemName: "bag")
            )
            .searchable(text: $searchText)
        }
        .background(Color.primaryBackground)
    }
    
    var searchText
}







struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(searchResults: .init([]))
    }
}






