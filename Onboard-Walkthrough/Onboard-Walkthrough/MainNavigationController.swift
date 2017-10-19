//
//  MainNavigationController.swift
//  Onboard-Walkthrough
//
//  Created by Khan Hussain on 19/10/17.
//  Copyright © 2017 kb. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //Login Controller      || Home Controller based on user loggedin status

        if isLoggedin(){
            let hvc = HomeViewController()
            viewControllers = [hvc]
        }else{
            perform(#selector(showLoginController), with: nil, afterDelay: 0.001)
        }

        
    }
    
    fileprivate func isLoggedin() -> Bool{
        return true
    }
    @objc func showLoginController(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = LoginViewController(collectionViewLayout: layout)
        present(cv, animated: true, completion: nil)
    }
    
    @objc func showHomeController(){
        
        let hvc = HomeViewController()
        present(hvc, animated: true, completion: nil)
    }
}
