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
