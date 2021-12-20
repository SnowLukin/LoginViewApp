//
//  Accounts.swift
//  LoginView
//
//  Created by Snow Lukin on 15.12.2021.
//

import UIKit

class User {
    let userName: String
    let password: String
    let person: Person
    
    init(userName: String, password: String, person: Person) {
        self.userName = userName
        self.password = password
        self.person = person
    }
    
    // TEST ACCOUNT
    static func getUser() -> User {
        User(userName: "@snowlukin",
             password: "Lukin",
             person: Person.getPerson())
    }
}

class Person {
    let name: String
    let surname: String
    let image: String
    let bio: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    init(name: String, surname: String, image: String, bio: String) {
        self.name = name
        self.surname = surname
        self.image = image
        self.bio = bio
    }
    
    static func getPerson() -> Person {
        Person(name: "Snow",
               surname: "Lukin",
               image: "JokerSquareImage",
               bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    }
}

