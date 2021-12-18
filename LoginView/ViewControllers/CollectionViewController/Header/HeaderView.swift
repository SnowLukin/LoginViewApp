//
//  HeaderView.swift
//  LoginView
//
//  Created by Snow Lukin on 18.12.2021.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "StreetImage")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // header layout
        backgroundColor = .red
        
        addSubview(imageView)
        
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
