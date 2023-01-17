//
//  LikeView.swift
//  ToDoList
//
//  Created by Tedtya rady on 17/1/2023.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct LikeView: View {
    
    @State var viewModel: ContentViewModel = .init()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack  {
            
            VStack {
                List{
//                    ForEach(Array(viewModel.searchproducts!.enumerated()), id: \.offset) { product in
//                        Text(product.title)
//                    }
                    Text("")
                }
            }
            
            .frame(maxWidth: .infinity)
            
        }
        .searchable(text: $searchText)
        
    }
}
