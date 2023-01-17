//
//  ListView.swift
//  ToDoList
//
//  Created by Tedtya rady on 11/1/2023.
//

import SwiftUI

struct ListView: View {
    
//        @Binding var searchedProducts: String = ""
//    @Binding var contentModel: ContentViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                
                
                
            }
        }
    }
}

struct RowView: View {
    var body: some View {
        HStack {
            Text("Name")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
//        ListView(searchedProducts: .init())
        ListView()
    }
}
