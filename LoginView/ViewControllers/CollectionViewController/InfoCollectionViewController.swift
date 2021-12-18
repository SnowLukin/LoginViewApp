//
//  InfoCollectionViewController.swift
//  LoginView
//
//  Created by Snow Lukin on 18.12.2021.
//

import UIKit

class InfoCollectionViewController: UICollectionViewController {
    
    private let cellID = "cellID"
    private let headerID = "headerID"
    private let padding: CGFloat = 16

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionViewLayout()
        setUpCollectionView()
    }
    
    // MARK: Number of cells in collection view
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    // MARK: Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                            withReuseIdentifier: headerID,
                                                            for: indexPath)
        return header
    }
    
    // MARK: Cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    
    // MARK: Light Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setUpCollectionViewLayout() {
        // layout customization
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    private func setUpCollectionView() {
        collectionView.setBlueColor()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerID)
        
        // ignore safe area
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
}

extension InfoCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // Cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding, height: 50)
    }
    
    // Header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: view.frame.width, height: 300)
    }
}
