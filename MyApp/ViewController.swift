//
//  ViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/16.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let registerButton = UIButton()
    let loginButton = UIButton()
    let registerButtonTag = 1001
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        setupUI()
    }
    
    func setupUI() -> Void {
        registerButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        registerButton.setTitle("register", for: .normal)
        registerButton.tag = registerButtonTag
        registerButton.addTarget(self, action: #selector(buttonDidtouch(button:)), for: .touchUpInside)
        view.addSubview(registerButton)
        
        loginButton.frame = CGRect(x: 100, y: 300, width: 100, height: 50)
        loginButton.setTitle("login", for: .normal)
        loginButton.addTarget(self, action: #selector(buttonDidtouch(button:)), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    func buttonDidtouch(button: UIButton) -> Void {
        if button.tag == registerButtonTag {
            navigationController?.pushViewController(RegisterViewController(), animated: true)
        } else {
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
}


