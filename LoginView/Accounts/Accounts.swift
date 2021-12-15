//
//  Accounts.swift
//  LoginView
//
//  Created by Snow Lukin on 15.12.2021.
//

import Foundation

class User {
    let userName: String
    let password: String
    
    init (userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
}

// MARK: TEST ACCOUNT
var users = [User(userName: "Eugenya", password: "Swiftbook")]
