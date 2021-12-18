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
        imageView.image = UIImage(named: "StreetImage")
        
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 40)
        nameLabel.textColor = .white
        return nameLabel
    }()
    
    var textLabel: UILabel = {
        let label = UILabel()
        var text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Velit ut tortor pretium viverra suspendisse potenti nullam. Diam quam nulla porttitor massa. Enim neque volutpat ac tincidunt vitae semper quis. Odio facilisis mauris sit amet massa vitae tortor condimentum lacinia. Nunc sed velit dignissim sodales ut eu. Nulla pellentesque dignissim enim sit. Vestibulum rhoncus est pellentesque elit ullamcorper. Non nisi est sit amet facilisis magna etiam tempor orci. Blandit cursus risus at ultrices mi tempus imperdiet nulla. Interdum varius sit amet mattis vulputate. Porttitor massa id neque aliquam."
        text += text
        let context = NSMutableAttributedString(string: text, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)
        ])
        
        context.setAttributes([
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)
        ], range: NSRange(location: 0, length: 11))
        label.textAlignment = .left
        label.text = text
        label.textColor = .black
        label.numberOfLines = 0
        label.attributedText = context
        
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray
        
        return scrollView
    }()
    
    var nameString: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        
        nameLabel.text = nameString ?? "Label"
        
        textLabel.frame.size.width = view.frame.width - 32
        textLabel.sizeToFit()
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(textLabel)
        
        scrollView.contentSize.height = textLabel.frame.height
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
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
            scrollView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
        ])
    }
}
