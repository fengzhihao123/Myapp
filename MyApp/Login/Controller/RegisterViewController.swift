//
//  RegisterViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/16.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    let accountTextfield = UITextField()
    let passwordTextfield = UITextField()
    let segueToLoginButton = UIButton()
    let messageLabel = UILabel()
    
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
        
        messageLabel.frame = CGRect(x: 100, y: 350, width: 100, height: 50)
        messageLabel.backgroundColor = UIColor.red
        messageLabel.accessibilityIdentifier = "messageLabel"
        view.addSubview(messageLabel)
    }
    
    //MARK:event
    func buttonDidTouch() -> Void {
        callRegisterUserAPI()
        chooseRootVC()
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
        
        let parameters: [String:Any] = ["key":accountTextfield.text!,
                                        "value":passwordTextfield.text!]
        
        Alamofire.request("http://127.0.0.1:8080/post", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("result: \(response.result)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
        
    }
}
