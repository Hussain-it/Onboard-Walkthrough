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
    let loginCellId = "LoginCellId"
    
    let pages:[Page] = {
        let firstPage = Page(title: "Share a great listen", message: "It's free to share a book in your life. Every recipient's first book is on us", imageName: "page1")
        
        let secondPage = Page(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"send this book\"", imageName: "page2")
        
        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu in upper corner. Choose \"send this book\"", imageName: "page3")
        
       return [firstPage,secondPage,thirdPage]
    }()
    
    lazy var pageControl:UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = UIColor.lightGray
        pc.currentPageIndicatorTintColor = UIColor.orange
        pc.numberOfPages = self.pages.count + 1
        return pc
    }()
    
    let skipButton:UIButton = {
        let b = UIButton()
        b.setTitle("Skip", for: .normal)
        b.setTitleColor(UIColor.orange, for: .normal)
        return b
    }()
    
    let nextButton:UIButton = {
        let b = UIButton()
        b.setTitle("Next", for: .normal)
        b.setTitleColor(UIColor.orange, for: .normal)
        return b
    }()
    var pageControlBottomAnchor:NSLayoutConstraint?
    var skipButtonTopAnchor:NSLayoutConstraint?
    var nextButtonTopAnchor:NSLayoutConstraint?
//-------------------------- METHODS ----------------------//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.isPagingEnabled = true
        
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        pageControlBottomAnchor = pageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)[1]
        
        
        skipButtonTopAnchor = skipButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50)[0]
        
        nextButtonTopAnchor = nextButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50)[0]
    }
    
    fileprivate func registerCells(){
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: PageCell.id)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: loginCellId)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pages.count + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
        
        if(indexPath.row == pages.count){
            pageControlBottomAnchor?.constant = 40
            skipButtonTopAnchor?.constant = -40
            nextButtonTopAnchor?.constant = -40
        }else{
            pageControlBottomAnchor?.constant = 0
            skipButtonTopAnchor?.constant = 16
            nextButtonTopAnchor?.constant = 16
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Last Cell as Login Page
        if(indexPath.item == pages.count){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.id, for: indexPath) as! PageCell

        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}


