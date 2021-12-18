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
    
//    let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "JokerSquareImage")
//
//        return imageView
//    }()
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 20
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
        
        userImageView.image = UIImage(named: "JokerSquareImage")
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("WillLayoutSubviews")
        userImageView.getCircleView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 195),
//            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageView.heightAnchor.constraint(equalToConstant: 150),
//            imageView.widthAnchor.constraint(equalToConstant: 150)
//        ])
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
