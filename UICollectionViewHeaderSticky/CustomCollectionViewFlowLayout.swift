//
//  CustomCollectionViewFlowLayout.swift
//  UICollectionViewHeaderSticky
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/12/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {

    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        guard let collectionView = collectionView else { return layoutAttributes }
        
        layoutAttributes?.filter{ $0.representedElementKind == UICollectionView.elementKindSectionHeader }.first.flatMap{ attribues -> () in
            let height = CGFloat(Int(attribues.frame.height) - Int(collectionView.contentOffset.y))
            
            attribues.frame = CGRect(x: 0, y: collectionView.contentOffset.y, width: collectionView.frame.width, height: height)
            
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
