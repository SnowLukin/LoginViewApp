//
//  WelcomeViewController.swift
//  LoginView
//
//  Created by Snow Lukin on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 20
        welcomeLabel.text = "Welcome, \(user?.person.fullName ?? "")!"
        
        userImageView.image = UIImage(named: user?.person.image ?? "JokerSquareImage")
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        userImageView.getCircleView()
    }
    
}

extension UIImageView {
    func getCircleView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
    }
}
