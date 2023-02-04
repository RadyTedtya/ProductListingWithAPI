//
//  User.swift
//  ToDoList
//
//  Created by Tedtya rady on 19/1/2023.
//

import Foundation

struct LoginResponse: Decodable {
    
    var id: Int
    var username: String
    var email: String
    var firstName: String
    var lastName: String
    var gender: String
    var image: String
    var token: String?
    var message: String?
    
}


struct User: Identifiable, Decodable {
    let id: Int
    let firstName: String?
    let lastName: String
    let maidenName: String
    let age: Int
    let gender: String
    let email: String
    let phone: String
    let username: String
    let password: String
    let birthDate: String
    let image: String?
    let bloodGroup: String
    let height: Double
    let weight: Double
    let eyeColor: String
    
    static let dummUser: User = .init(id: 1, firstName: "Tom", lastName: "J", maidenName: "Johny", age: 20, gender: "Male", email: "tomjjohny@gmail.com", phone: "+61441 045 323", username: "kminchelle", password: "kminchelle@qq.com", birthDate: "04 Jan 1984", image: "https://robohash.org/hicveldicta.png?size=50x50&set=set1", bloodGroup: "A+", height: 188.2, weight: 180, eyeColor: "blue")
}

    



