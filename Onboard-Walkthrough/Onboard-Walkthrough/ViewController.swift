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

    let pages:[Page] = {
        let firstPage = Page(title: "Share a great listen", message: "It's free to share a book in your life. Every recipient's first book is on us", imageName: "page1")
        
        let secondPage = Page(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"send this book\"", imageName: "page2")
        
        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu in upper corner. Choose \"send this book\"", imageName: "page3")
        
       return [firstPage,secondPage,thirdPage]
    }()
    
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
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.id, for: indexPath) as! PageCell

        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}


