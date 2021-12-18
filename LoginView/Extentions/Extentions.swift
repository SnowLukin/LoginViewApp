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
        
        let blueBackgroundColor = UIColor(red: 0.091, green: 0.137, blue: 0.174, alpha: 1)
        self.backgroundColor = blueBackgroundColor
    }
    
    func hideView(hidden: Bool) {
        
        UIView.transition(with: self, duration: 0.1, options: .transitionCrossDissolve, animations: {
            self.isHidden = hidden
        })
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
