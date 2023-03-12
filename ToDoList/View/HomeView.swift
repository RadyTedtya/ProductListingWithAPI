//
//  HomeView.swift
//
//
//  Created by Tedtya rady on 10/1/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    @ObservedObject var viewModel: ContentViewModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    init(viewModel: ContentViewModel, loginViewModel: LoginViewModel) {
        self.viewModel = viewModel
        self.loginViewModel = loginViewModel
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.tertiaryBackground)
        UISegmentedControl.appearance().backgroundColor = UIColor(Color.white)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    var dataSource:[Product] {
        if viewModel.selectedDisplayType == .all {
            return viewModel.products!
        }
        if viewModel.selectedDisplayType == .sale {
            return viewModel.products!.filter {$0.discountPercentage! > 5.0 } //filter products with discoutprice more than 5.0$
        }
        if viewModel.selectedDisplayType == .trending {
            return viewModel.products!.filter {$0.rating! > 4.50} //filter products with rating more than 4.5
        }
        return viewModel.products!
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Picker(selection: $viewModel.selectedDisplayType, label: Text("Display Product")){
                    ForEach(DisplayProductType.allCases){
                        Text($0.rawValue.capitalized)
                            .tag($0.id)
                    }
                }
                .foregroundColor(Color.black)
                .pickerStyle(.segmented)
                
                Spacer()
                
                if !(viewModel.products ?? []).isEmpty {
                    ScrollView(.vertical) {
                        VStack {
                            LazyVGrid(columns: columns) {
                                ForEach(Array(dataSource.enumerated()), id: \.offset) { index, product in
                                    NavigationLink {
                                        ProductDetailView(product: product, viewModel: viewModel)
                                    } label: {
                                        ProductCardView(product: product, viewModel: viewModel)
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
                viewModel.selectedCategory = ""
                viewModel.resetProducts()
                viewModel.fetchProductsPagination()
            }
            .frame(maxWidth: .infinity)
            .background(Color.primaryBackground)
            .navigationBarTitle("Products", displayMode: .inline)
            .navigationBarItems(trailing:
                                    NavigationLink {
                if Singleton.shared.loginSuccess {
                    CartView(loginViewModel: loginViewModel)
                } else {
                    SignInView(loginViewModel: loginViewModel)
                }
            } label: {
                Image(systemName: "bag")
            })
            .searchable(text: $viewModel.searchText)
            .onSubmit(of: .search) {
                viewModel.resetProducts()
                viewModel.fetchProductsPagination()
            }
        }
    }
    
}



