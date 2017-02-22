//
//  RegisterViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/16.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit
import Alamofire
import Moya
import SwiftyJSON

class RegisterViewController: UIViewController {
    var accountTextfield = LoginTextField()
    var passwordTextfield = LoginTextField()
    var segueToLoginButton = UIButton()
    var registerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupUI()
    }
    
    //MARK:Attribute
    func setupAttribute() {
        view.backgroundColor = UIColor.white
    }
    
    //MARK:UI
    func setupUI() {
        accountTextfield = LoginTextField().then({ (textField) in
            textField.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
            textField.center = CGPoint(x: SCREEN_WIDTH/2, y: 150)
        })
        view.addSubview(accountTextfield)
        
        passwordTextfield = LoginTextField().then({ (textField) in
            textField.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
            textField.center = CGPoint(x: SCREEN_WIDTH/2, y: 230)
        })
        view.addSubview(passwordTextfield)
        
        registerButton = UIButton().then({ (button) in
            button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
            button.center = CGPoint(x: SCREEN_WIDTH/4, y: 300)
            button.setTitle("注册", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(registerButtonDidTouch), for: .touchUpInside)
        })
        view.addSubview(registerButton)
        
        segueToLoginButton = UIButton().then({ (button) in
            button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
            button.center = CGPoint(x: SCREEN_WIDTH/4 * 3, y: 300)
            button.setTitle("返回登录", for: .normal)
            button.addTarget(self, action: #selector(segueToLoginButtonDidTouch), for: .touchUpInside)
            button.setTitleColor(UIColor.black, for: .normal)
        })
        view.addSubview(segueToLoginButton)
    }
    
    func setupAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "sure", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK:event
    func registerButtonDidTouch() {
        callRegisterUserAPI()
    }
    
    func segueToLoginButtonDidTouch() {
        let vc = navigationController?.popViewController(animated: true)
        print(vc ?? "no vc")
    }
    
    //MARK:Network Layer
    func callRegisterUserAPI() -> Void {
        guard (accountTextfield.text?.characters.count)! > 0 else {
            setupAlert(message: "account is nil")
            return
        }
        guard (passwordTextfield.text?.characters.count)! > 0 else {
            setupAlert(message: "password is nil")
            return
        }
        
        let provider = MoyaProvider<LoginAPI>()
        provider.request(.register(userTel: accountTextfield.text!, userPassword: passwordTextfield.text!)) { result in
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
