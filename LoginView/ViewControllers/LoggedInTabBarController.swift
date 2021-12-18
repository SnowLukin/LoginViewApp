//
//  LoggedInTabBarController.swift
//  LoginView
//
//  Created by Snow Lukin on 17.12.2021.
//

import UIKit

class LoggedInTabBarController: UITabBarController {

    var testString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding top border to tabbar
        addTabBarTopLine()
    }
    
    
    private func addTabBarTopLine() {
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.3))
        lineView.backgroundColor = .gray
        tabBar.addSubview(lineView)
    }
}
