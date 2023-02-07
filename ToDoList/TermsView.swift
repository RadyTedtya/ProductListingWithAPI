//
//  TermsView.swift
//  ToDoList
//
//  Created by Tedtya rady on 5/2/2023.
//

import Foundation
import SwiftUI

struct TermsView:View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("These terms and conditions (together with the information and policies contained in the Customer Service pages on the website and any other documents referred in these terms and conditions) (Terms and Conditions) set out the legal terms that apply to your use of our website http://www.todolist.com, any of its sub-domains and any other websites operated by us or on our behalf and any mobile device application or desktop application developed by us or on our behalf (together, the Websites and “Website” being a reference to any one of them) and the other services that we provide (the Services).")
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Text("Please read these Terms and Conditions carefully and make sure that you understand them before using the Services. Please note that by using the Services, you agree to be bound by these Terms and Conditions. If you do not accept these Terms and Conditions, you will not be able to use the Services and you should leave the Website immediately. If you continue to use the Website or if you order products, we will take this as your acceptance of these Terms and Conditions.")
                        .multilineTextAlignment(.center)
                    
                }
                .padding()
                .padding()
                .navigationBarTitle("Terms and Condition", displayMode: .inline)
            }
        }
    }
}
