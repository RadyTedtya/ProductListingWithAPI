//
//  ContentView.swift
//  ToDoList
//
//  Created by Tedtya rady on 10/1/23.
//

import SwiftUI

struct ApiDataTesting: View {
    
    @ObservedObject var viewModel: ContentViewModel = .init()
    
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
                            ForEach(viewModel.products!) { product in
                                Text(product.title)
                            }
                        }
                    }
                }
            
                
            }
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}

struct ApiDataTesting_Previews: PreviewProvider {
    static var previews: some View {
        ApiDataTesting()
    }
}
