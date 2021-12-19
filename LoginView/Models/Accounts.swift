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
    
    let name: String
    let surname: String
    let bio: String
    
    
    
    init(userName: String, password: String, name: String, surname: String, bio: String) {
        self.userName = userName
        self.password = password
        self.name = name
        self.surname = surname
        self.bio = bio
    }
}

// MARK: TEST ACCOUNT
private var text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Velit ut tortor pretium viverra suspendisse potenti nullam. Diam quam nulla porttitor massa. Enim neque volutpat ac tincidunt vitae semper quis. Odio facilisis mauris sit amet massa vitae tortor condimentum lacinia. Nunc sed velit dignissim sodales ut eu. Nulla pellentesque dignissim enim sit. Vestibulum rhoncus est pellentesque elit ullamcorper. Non nisi est sit amet facilisis magna etiam tempor orci. Blandit cursus risus at ultrices mi tempus imperdiet nulla. Interdum varius sit amet mattis vulputate. Porttitor massa id neque aliquam."
private let snowAccount = User(userName: "@snowlukin", password: "Lukin", name: "Snow", surname: "Lukin", bio: text+text)

let users = [snowAccount]
