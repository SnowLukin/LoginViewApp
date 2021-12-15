//
//  WelcomeViewController.swift
//  LoginView
//
//  Created by Snow Lukin on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradient()
        
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }
    
    @IBAction func logoutClicked() {
        dismiss(animated: true)
    }
    
}
