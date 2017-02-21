//
//  LoginViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/16.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    let accountTextfield = UITextField()
    let passwordTextfield = UITextField()
    let segueToRegisterButton = UIButton()
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
        
        segueToRegisterButton.frame = CGRect(x: 100, y: 280, width: 100, height: 50)
        segueToRegisterButton.setTitle("ToRegisterVC", for: .normal)
        segueToRegisterButton.addTarget(self, action: #selector(buttonDidTouch), for: .touchUpInside)
        segueToRegisterButton.backgroundColor = UIColor.black
        view.addSubview(segueToRegisterButton)
    }
    //MARK:event
    func buttonDidTouch() -> Void {
        navigationController?.pushViewController(registerVC, animated: true)
//        callLoginAPI()
    }
    
    func callLoginAPI() -> Void {
        guard (accountTextfield.text?.characters.count)! > 0 else {
            print("account is nil")
            return
        }
        guard (passwordTextfield.text?.characters.count)! > 0 else {
            print("password is nil")
            return
        }
        
        let parameters: [String:Any] = ["usertel":accountTextfield.text!,
                                        "Password":passwordTextfield.text!]
        
        Alamofire.request("http://127.0.0.1:8080/v1/login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("result: \(response.result)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
    }
}
