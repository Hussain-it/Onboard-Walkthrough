//
//  PageCell.swift
//  Onboard-Walkthrough
//
//  Created by Khan Hussain on 15/10/17.
//  Copyright © 2017 kb. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    //--- Properties ---//
    static let id = "PageCellId"
    
    let imageView:UIImageView = {
       
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "page1")
        iv.clipsToBounds = true
        return iv
    }()
    
    //--- Methods ---//
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()  {
        addSubview(imageView)
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
}
