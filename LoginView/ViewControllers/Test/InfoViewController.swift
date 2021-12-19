//
//  InfoViewController.swift
//  LoginView
//
//  Created by Snow Lukin on 17.12.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    var user: User?
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "StreetImage")
        
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 40)
        nameLabel.textColor = .white
        return nameLabel
    }()
    
    var bioLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.setBlueColor()
        scrollView.layer.masksToBounds = true
        scrollView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "\(user?.name ?? "") \(user?.surname ?? "")"
        
        setBioLabelText()
        bioLabel.frame.size.width = view.frame.width - 32
        bioLabel.sizeToFit()
        scrollView.contentSize.height = bioLabel.frame.height
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(bioLabel)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height / 2.5),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.7),
            
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 35),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10)
        ])
    }
    
    private func setBioLabelText() {
        let context = NSMutableAttributedString(string: user?.bio ?? "", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
        ])
        
        context.setAttributes([
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)
        ], range: NSRange(location: 0, length: 11))
        bioLabel.attributedText = context
    }
}
