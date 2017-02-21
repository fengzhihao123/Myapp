//
//  LoginViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/16.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit
import Alamofire
import Moya
import SwiftyJSON
class LoginViewController: UIViewController {

    let accountTextfield = UITextField()
    let passwordTextfield = UITextField()
    let segueToRegisterButton = UIButton()
    let loginButton = UIButton()
    let registerVC = RegisterViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupUI()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupAttribute() -> Void {
        navigationItem.title = "login"
        view.backgroundColor = UIColor.white
    }
    
    //MARK:UI
    func setupUI() -> Void {
        
        accountTextfield.frame = CGRect(x: 100, y: 100, width: 300, height: 50)
        accountTextfield.backgroundColor = UIColor.black
        accountTextfield.textColor = UIColor.white
        view.addSubview(accountTextfield)
        
        passwordTextfield.frame = CGRect(x: 100, y: 200, width: 300, height: 50)
        passwordTextfield.backgroundColor = UIColor.black
        passwordTextfield.textColor = UIColor.white
        view.addSubview(passwordTextfield)
        
        loginButton.frame = CGRect(x: 100, y: 280, width: 100, height: 50)
        loginButton.setTitle("login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonDidTouch), for: .touchUpInside)
        loginButton.backgroundColor = UIColor.black
        view.addSubview(loginButton)
        
        segueToRegisterButton.frame = CGRect(x: 280, y: 280, width: 100, height: 50)
        segueToRegisterButton.setTitle("to register", for: .normal)
        segueToRegisterButton.addTarget(self, action: #selector(segueButtonDidTouch), for: .touchUpInside)
        segueToRegisterButton.backgroundColor = UIColor.black
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
            print("account is nil")
            return
        }
        guard (passwordTextfield.text?.characters.count)! > 0 else {
            print("password is nil")
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
                print(error)
            }
        }
    }
    
    
}
