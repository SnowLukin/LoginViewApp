//
//  LoginVCExtentions.swift
//  LoginView
//
//  Created by Snow Lukin on 15.12.2021.
//

import UIKit


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
}

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
