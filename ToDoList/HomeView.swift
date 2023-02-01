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
//    @State var categories: [String] = ["All","New", "Sale"]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                        Picker(selection: $viewModel.selectedDisplayType, label: Text("")){
                            ForEach(DisplayProductType.allCases) {
                                Text($0.rawValue.capitalized)
                                    .tag($0.id)
                            }
                        }
                        .foregroundColor(Color.black)
                        .pickerStyle(SegmentedPickerStyle())
                        .overlay(   Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color.secondaryColor),
                                alignment: .bottom
                    )
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
                                            .onTapGesture {
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
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.tertiaryBackground)
                UISegmentedControl.appearance().backgroundColor = UIColor(Color.primaryColor)
            }
            .frame(maxWidth: .infinity)
            .background(Color.primaryBackground)
            .navigationBarItems(trailing:
                NavigationLink {
                    CartView(loginViewModel: loginViewModel)
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
        HomeView()
    }
}

