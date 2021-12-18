//
//  WelcomeViewController.swift
//  LoginView
//
//  Created by Snow Lukin on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
//        imageView.image = UIImage(named: "JokerSquareImage")
        
        return imageView
    }()
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
        
        view.addSubview(imageView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 195),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
    }
    
}
