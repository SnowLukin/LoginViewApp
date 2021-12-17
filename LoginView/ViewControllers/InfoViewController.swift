//
//  InfoViewController.swift
//  LoginView
//
//  Created by Snow Lukin on 17.12.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "JokerImage")
        
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.text = "Snow"
        nameLabel.textColor = .white
        return nameLabel
    }()
    
    var nameString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height / 2.5),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.7),
            
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}
