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
    
    // TEST ACCOUNT
    static func getUser() -> User {
        User(userName: "@snowlukin",
             password: "Lukin",
             name: "Snow",
             surname: "Lukin",
             bio: "Живу в Краснодаре, учусь тут же. \nНаправление Фундаментальная информатика и информационные технологии. Скорее математик чем программист, не знаю что хуже. \nВ университетах России не преподают Swift поэтому я с большим удовольствием хожу на пары раз в месяц и умудряюсь закрывать экзамены автоматами. \nПосле университета планирую поехать в Америку к Тиму Куку и работать на него за миллион долларов в секунду, а также найти богатую жену, чтобы она покупала мне дорогие вещи.\nКонец.\nP.S. Не придумал ничего остроумнее")
    }
}
