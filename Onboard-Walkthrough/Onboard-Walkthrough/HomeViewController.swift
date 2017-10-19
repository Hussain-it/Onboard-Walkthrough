//
//  HomeViewController.swift
//  Onboard-Walkthrough
//
//  Created by Khan Hussain on 19/10/17.
//  Copyright © 2017 kb. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.7, alpha: 0.9)
        let imageView = UIImageView(image: UIImage(named: "homeWynk"))
        view.addSubview(imageView)
        
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }

}
