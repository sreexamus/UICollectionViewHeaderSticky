//
//  UICollectionViewHeaderView.swift
//  UICollectionViewHeaderSticky
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/12/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class UICollectionViewHeaderView: UICollectionReusableView {
    var imageGraphic: UIImageView!
    var animator: UIViewPropertyAnimator!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageGraphic = UIImageView(image: UIImage(named: "graphic-1"))
        addEdgeConstrained(subview: imageGraphic)
        
        animator = UIViewPropertyAnimator(duration: 3, curve: UIView.AnimationCurve.linear, animations: {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            self.addEdgeConstrained(subview: visualEffectView)
        })

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension UIView {
    func addEdgeConstrained(subview: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        subview.leftAnchor.constraint(equalTo: leftAnchor, constant: insets.left).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom).isActive = true
        subview.rightAnchor.constraint(equalTo: rightAnchor, constant: -insets.right).isActive = true
    }
}
