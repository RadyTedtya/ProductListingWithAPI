//
//  SettingView.swift
//  ToDoList
//
//  Created by Tedtya rady on 19/1/2023.
//

import Foundation
import SwiftUI

struct SettingView: View {
    
    // Associate value
    enum SettingType: String, CaseIterable, Identifiable {
        
        case signUp
        case loggin
        case about
        
        var id: Self {
            return self
        }
        
        var view: any View {
            switch self {
            case .signUp:
                return SignUpView()
            case .loggin:
                return SignInView()
            case .about:
                return AboutView()
            }
        
        }
        
    }

    private let _dataSource: [SettingType] = SettingType.allCases
    
    var body: some View {
        NavigationView {
            VStack {
                VStack (alignment: .leading) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width:50 ,height: 50)
                        .padding(.bottom)
                    Text("Tedtya RADY")
                    
                    
                    List {
                        VStack(alignment: .leading, spacing: 30) {
                            ForEach(_dataSource) { each in
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
    
}


    
    //VStack(alignment: .leading) {
    //
    //    Image(systemName: "person.crop.circle.fill")
    //        .resizable()
    //        .frame(width:50 ,height: 50)
    //        .padding(.bottom)
    //
    //    Text("Tedtya RADY")
    //
    //    Spacer()
    //
    //
    //    List {
    //        ScrollView {
    //            VStack(alignment: .leading, spacing: 30) {
    //                ForEach(allViews) { each in
    //                    NavigationLink {
    //                        AnyView(each.view)
    //                    } label: {
    //                        Text(each.rawValue.capitalized)
    //                            .font(.system(size: 18))
    //                            .foregroundColor(Color.black)
    //
    //                    }
    //                }
    //            }
    //        }
    //    }
    //
    //    .background(Color.white)
    //    .padding()
    //    .padding()
    //}


















// MARK: - explanation of delegate and referencing


protocol ChildDelegate: AnyObject {
    func onTrigger()
}

class Parent: ChildDelegate  {
    
    let child: Child = .init()
    
    init() {
        child.delegate = self
    }
    
    func onTrigger() {
        print("Hello Trigger")
    }
}


class Child {
    
    weak var delegate: ChildDelegate?
    
    init() {
    }
    
    func test() {
        delegate?.onTrigger()
    }
 
}




class Vehicle {
    
    let motor: Motor = .init()
    
    init () {
    }
    
    func horn() {
        print("Honk Honk")
    }
}


class Motor {
    weak var delegate: MotorDelegate?
    
    init() {
    }
    
    func startHorn() {
        delegate?.horn()
    }
}

protocol MotorDelegate:AnyObject {
    func horn()
}







class ParentTwo  {
    
    let child: ChildTwo = .init()
    
    init() {
        child.onCompletion = {
            self.onTrigger()
        }
        
        child.test()
    }
    
    func onTrigger() {
        print("Hello Trigger")
    }
    
}



class ChildTwo {
    
    var onCompletion: (() -> Void)? = nil
    
    init() {
        
    }
    
    func test() {
        self.onCompletion?()
//        delegate?.onTrigger()
    }
 
}



