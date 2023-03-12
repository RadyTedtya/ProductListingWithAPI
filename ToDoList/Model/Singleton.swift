//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Tedtya rady on 12/3/2023.
//

import Foundation

class Singleton {
    
    var loginSuccess: Bool = false
    var signUpSuccess: Bool = false
    
    static let shared = Singleton()
    
    private init() { }
    
}

