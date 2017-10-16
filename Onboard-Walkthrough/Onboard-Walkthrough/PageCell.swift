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
    var page:Page?  {
        
        didSet{
            guard let page = page else {
                return
            }
            imageView.image = UIImage(named: page.imageName)
            
            let textColor = UIColor(white: 0.2, alpha: 1)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedStringKey.foregroundColor:textColor])
            
            let attributedMessage = NSMutableAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor:textColor])
            
            attributedText.append(attributedMessage)
            
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let range = NSRange(location: 0, length: attributedText.string.count)

            attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
            textView.attributedText = attributedText
            
        }
    }
    
    let imageView:UIImageView = {
       
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "page1")
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView:UITextView = {
       let tv = UITextView()
        tv.text = "Welcome to Walkthrough"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16)
        return tv
    }()
    
    let separatorView:UIView = {
       let v = UIView()
        v.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return v
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
        addSubview(textView)
        addSubview(separatorView)
        
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        
        textView.anchorToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true

        separatorView.anchorToTop(top: nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
}