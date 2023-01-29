//
//  SettingView.swift
//  ToDoList
//
//  Created by Tedtya rady on 19/1/2023.
//

import Foundation
import SwiftUI

struct SettingView: View {
    let allViews: [AllViews] = AllViews.allCases
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width:50 ,height: 50)
                    .padding(.bottom)
                
                Text("Tedtya RADY")
                
                Spacer()
                
                
                List {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 30) {
                            ForEach(allViews) { each in
                                NavigationLink {
                                    AnyView(each.view)
                                } label: {
                                    Text(each.rawValue.capitalized)
                                        .font(.system(size: 18))
                                        .foregroundColor(Color.black)
                                    
                                }
                            }
                        }
                    }
                }
                
            }
            .background(Color.white)
            .padding()
            .padding()
        }
    }
}



struct SettingView_Preview: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
