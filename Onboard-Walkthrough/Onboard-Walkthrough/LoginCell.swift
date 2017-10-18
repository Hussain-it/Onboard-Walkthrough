//
//  LoginCell.swift
//  Onboard-Walkthrough
//
//  Created by Khan Hussain on 18/10/17.
//  Copyright © 2017 kb. All rights reserved.
//

import UIKit

class LoginCell: UICollectionViewCell {
    //--- Properties ---//
    static let id = "LoginCellId"
    
    let logoImageView:UIImageView = {
       let image = UIImage(named: "logo")
        let iv = UIImageView(image: image)
        return iv
    }()
    
    let emailTextField:LeftPaddedTextField = {
    
        let tf = LeftPaddedTextField()
        tf.placeholder = "Enter Email"
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.keyboardType = .emailAddress
        return tf
        
    }()

    let passwordTextField:LeftPaddedTextField = {
        
        let tf = LeftPaddedTextField()
        tf.placeholder = "Enter Password"
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.isSecureTextEntry = true
        return tf
        
    }()
    
    let loginButton:UIButton = {
        let b = UIButton()
        b.backgroundColor = UIColor.orange
        b.setTitleColor(UIColor.white, for: .normal)
        b.setTitle("Login", for: .normal)
        return b
    }()
    
    //--- Methods ---//
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(logoImageView)
        _ = logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -200, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(emailTextField)
        _ = emailTextField.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        addSubview(passwordTextField)
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        addSubview(loginButton)
        _ = loginButton.anchor(passwordTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class LeftPaddedTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 10, height: bounds.size.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 10, height: bounds.size.height)
    }
}
