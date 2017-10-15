//
//  ViewController.swift
//  Onboard-Walkthrough
//
//  Created by Khan Hussain on 15/10/17.
//  Copyright © 2017 kb. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

//-------------------------- Properties ----------------------//

    
//-------------------------- METHODS ----------------------//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: PageCell.id)
        collectionView?.backgroundColor = UIColor.red
        collectionView?.isPagingEnabled = true
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.id, for: indexPath)

        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}


