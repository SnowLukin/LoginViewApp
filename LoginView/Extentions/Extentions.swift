//
//  LoginVCExtentions.swift
//  LoginView
//
//  Created by Snow Lukin on 15.12.2021.
//

import UIKit


// MARK: UIView
extension UIView {
    
    func setGradient() {
        
        let firstColor = UIColor.systemBlue.cgColor
        let secondColor = UIColor.red.cgColor
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.colors = [firstColor, secondColor]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setBlueColor() {
        
        let backgroundColor = UIColor(red: 0.091, green: 0.137, blue: 0.174, alpha: 1)
        self.backgroundColor = backgroundColor
    }
    
    func setLightBlueColor() {
        
        let backgroundColor = UIColor(red: 0.126, green: 0.188, blue: 0.249, alpha: 1)
        self.backgroundColor = backgroundColor
    }
    
    func hideView(hidden: Bool) {
        
        UIView.transition(with: self, duration: 0.1, options: .transitionCrossDissolve, animations: {
            self.isHidden = hidden
        })
    }
    
    // Contraints to superview = 0
    func fillSuperview() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let superviewTopAnchor = superview?.topAnchor {
            self.topAnchor.constraint(equalTo: superviewTopAnchor).isActive = true
        }
        if let superviewBottomAnchor = superview?.bottomAnchor {
            self.bottomAnchor.constraint(equalTo: superviewBottomAnchor).isActive = true
        }
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            self.leadingAnchor.constraint(equalTo: superviewLeadingAnchor).isActive = true
        }
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            self.trailingAnchor.constraint(equalTo: superviewTrailingAnchor).isActive = true
        }
    }
}

// MARK: UITextField
extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 5, width: 20, height: 20))
        let iconContainerView: UIView = UIView(frame:
                       CGRect(x: 20, y: 0, width: 30, height: 30))
        iconView.image = image
       
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}


// MARK: UIAlertController
extension UIAlertController {
    
    func setNeededFont() {
        let attributedString = NSAttributedString(string: self.message ?? "", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor : UIColor.gray
        ])
        
        self.setValue(attributedString, forKey: "attributedMessage")
    }
}
