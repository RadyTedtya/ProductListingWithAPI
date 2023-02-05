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
    @ObservedObject var viewModel: ContentViewModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.tertiaryBackground)
        UISegmentedControl.appearance().backgroundColor = UIColor(Color.white)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Picker(selection: $viewModel.selectedDisplayType, label: Text("Display Product")){
                    ForEach(DisplayProductType.allCases) {
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
                                ForEach(Array(viewModel.products!.enumerated()), id: \.offset) { index, product in
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
                if loginViewModel.loginResult == .success {
                    CartView(loginViewModel: loginViewModel)
                } else {
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init())
    }
}

