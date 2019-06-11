//
//  StickyHeaderCollectionViewcontroller.swift
//  UICollectionViewHeaderSticky
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/12/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "Cell"
private let headerReuseIdentifier = "Header"

class StickyHeaderCollectionViewcontroller: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var headerview: UICollectionViewHeaderView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.register(UICollectionViewHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
        cell.backgroundColor = .yellow
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! UICollectionViewHeaderView
        headerview = header
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 200)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
         print(scrollView.contentOffset.y)
        
        if scrollView.contentOffset.y >= -44 {
            DispatchQueue.main.async {
                self.headerview?.animator.fractionComplete = 0
            }
            return
        }
        headerview?.animator.fractionComplete = abs(scrollView.contentOffset.y) / 100
    }
    
}

