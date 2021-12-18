//
//  HeaderLayout.swift
//  LoginView
//
//  Created by Snow Lukin on 18.12.2021.
//

import UIKit

class HeaderLayout: UICollectionViewFlowLayout {

    // modifying attributes
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                
                // to not deal with optional value
                guard let collectionView = collectionView else { return }
                
                let contentOffsetY = collectionView.contentOffset.y
                print(contentOffsetY)
                if contentOffsetY > 0 {
                    return
                }
                
                let width = collectionView.frame.width
                let height = attributes.frame.height - contentOffsetY
                
                // header
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
                
            }
            
            
            
        })
        
        return layoutAttributes
    }
    
    // track scrolling
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
