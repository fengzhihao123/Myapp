//
//  LoginViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/16.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

class LoginViewController: UIViewController {
    var accountTextfield = LoginTextField()
    var passwordTextfield = LoginTextField()
    var segueToRegisterButton = UIButton()
    var loginButton = UIButton()
    let registerVC = RegisterViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupUI()
    }
    
    //MARK:Attribute
    func setupAttribute() -> Void {
        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK:UI
    func setupUI() -> Void {
        accountTextfield = LoginTextField().then({ (textField) in
            textField.accessibilityIdentifier = "account"
            textField.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
            textField.center = CGPoint(x: SCREEN_WIDTH/2, y: 150)
        })
        view.addSubview(accountTextfield)
        
        passwordTextfield = LoginTextField().then({ (textField) in
            textField.accessibilityIdentifier = "password"
            textField.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
            textField.center = CGPoint(x: SCREEN_WIDTH/2, y: 230)
        })
        view.addSubview(passwordTextfield)
        
        loginButton = UIButton().then({ (button) in
            button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
            button.center = CGPoint(x: SCREEN_WIDTH/4, y: 300)
            button.setTitle("登录", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(loginButtonDidTouch), for: .touchUpInside)
        })
        view.addSubview(loginButton)
        
        segueToRegisterButton = UIButton().then({ (button) in
            button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
            button.center = CGPoint(x: SCREEN_WIDTH/4 * 3, y: 300)
            button.setTitle("前往注册", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(segueButtonDidTouch), for: .touchUpInside)
        })
        view.addSubview(segueToRegisterButton)
    }
    
    func setupAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "sure", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK:event
    func loginButtonDidTouch() {
        callLoginAPI()
    }
    
    func segueButtonDidTouch()  {
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func callLoginAPI() {
        guard (accountTextfield.text?.characters.count)! > 0 else {
            setupAlert(message: "account is nil")
            return
        }
        guard (passwordTextfield.text?.characters.count)! > 0 else {
            setupAlert(message: "password is nil")
            return
        }
        
        let provider = MoyaProvider<LoginAPI>()
        provider.request(.login(userTel: accountTextfield.text!, userPassword: passwordTextfield.text!)) { result in
            switch result {
            case let .success(moyaResponse):
                let json = JSON(data: moyaResponse.data)
                
                if let token = json["token"].string {
                    UserDefaults.standard.set(token, forKey: "UserToken")
                    chooseRootVC()
                }
            
                if let error = json["error"].string {
                    self.setupAlert(message: error)
                }
            case let .failure(error):
                self.setupAlert(message: "网络连接错误")
                print(error)
            }
        }
    }
    
}
