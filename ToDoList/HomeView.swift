//
//  HomeView.swift
//
//
//  Created by Tedtya rady on 10/1/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel = .init()
    @ObservedObject var viewModel: ContentViewModel = .init()
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
                    .overlay(   Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.blue),
                                alignment: .bottom
                    )
                }
                
                Spacer()
                
                if !(viewModel.products ?? []).isEmpty {
                    ScrollView(.vertical) {
                        VStack {
                            LazyVGrid(columns: columns) {
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
                    }
                }
            }
            .onAppear {
                viewModel.resetProducts()
                viewModel.fetchProductsPagination()
            }
            .frame(maxWidth: .infinity)
            .background(Color.primaryBackground)
            .navigationBarItems(trailing:
                                    NavigationLink {
                switch loginViewModel.loginResult {
                case .success:
                    CartView()
                case .failure:
                    SignInView()
                case .loading:
                    SignInView()
                }
            } label: {
                Image(systemName: "bag")
            }
            )
            .searchable(text: $viewModel.searchText)
            .onSubmit(of: .search) {
                viewModel.resetProducts()
                viewModel.fetchProductsPagination()
            }
        }
        .navigationTitle("Home Page")
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

