//
//  SettingView.swift
//  ToDoList
//
//  Created by Tedtya rady on 19/1/2023.
//

import Foundation
import SwiftUI

struct SettingView: View {
    var body: some View {
        
        
        VStack(alignment: .leading) {
            
            
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width:50 ,height: 50)
                .padding(.bottom)
            
            Text("Tedtya RADY")
            
            Spacer()
            
            
            List {
                VStack(alignment: .leading, spacing: 30) {
                    
                }
            }
            
        }
        .padding()
        .padding()
    }
}



struct SettingView_Preview: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
