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

    let accountTextfield = UITextField()
    let passwordTextfield = UITextField()
    let segueToLoginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "register"
        navigationController?.navigationBar.accessibilityIdentifier = "Menu"
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
    //MARK:UI
    func setupUI() -> Void {
        accountTextfield.frame = CGRect(x: 100, y: 100, width: 300, height: 50)
        accountTextfield.textColor = UIColor.white
        accountTextfield.backgroundColor = UIColor.black
        view.addSubview(accountTextfield)
        
        passwordTextfield.frame = CGRect(x: 100, y: 200, width: 300, height: 50)
        passwordTextfield.textColor = UIColor.white
        passwordTextfield.backgroundColor = UIColor.black
        view.addSubview(passwordTextfield)
        
        segueToLoginButton.frame = CGRect(x: 100, y: 280, width: 100, height: 50)
        segueToLoginButton.setTitle("ToRegisterVC", for: .normal)
        segueToLoginButton.addTarget(self, action: #selector(buttonDidTouch), for: .touchUpInside)
        segueToLoginButton.backgroundColor = UIColor.black
        segueToLoginButton.accessibilityIdentifier = "segue"
        view.addSubview(segueToLoginButton)
        
    }
    
    func setupAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "sure", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK:event
    func buttonDidTouch() {
        callRegisterUserAPI()
    }
    
    //MARK:Network Layer
    func callRegisterUserAPI() -> Void {
        guard (accountTextfield.text?.characters.count)! > 0 else {
            print("account is nil")
            return
        }
        guard (passwordTextfield.text?.characters.count)! > 0 else {
            print("password is nil")
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
                print(error)
            }
        }
    }
}
