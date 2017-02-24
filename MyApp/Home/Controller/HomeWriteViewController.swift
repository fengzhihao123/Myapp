//
//  HomeWriteViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/24.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class HomeWriteViewController: UIViewController {
    var contentTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupUI()
    }
    
    //MARK: attribute
    func setupAttribute() {
        view.backgroundColor = UIColor.white
    }
    
    //MARK: setupUI
    func setupUI() {
        let releaseButton = UIButton().then { (button) in
            button.frame = CGRect(x: 300, y: 10, width: 50, height: 50)
            button.setTitle("发布", for: .normal)
            button.setTitleColor(UIColor.colorWithHexString("3594fb"), for: .normal)
            button.addTarget(self, action: #selector(releaseButtonDidTouch), for: .touchUpInside)
        }
        view.addSubview(releaseButton)
        
        let titleTextField = UITextField().then { (textField) in
            textField.frame = CGRect(x: 0, y: 100, width: SCREEN_WIDTH, height: 50)
            textField.tintColor = UIColor.black
            textField.backgroundColor = UIColor.green
            textField.placeholder = "请在此处输入标题"
        }
        view.addSubview(titleTextField)
        
        contentTextView = UITextView().then { (textView) in
            textView.frame = CGRect(x: 0, y: 200, width: SCREEN_WIDTH, height: 200)
            textView.tintColor = UIColor.black
            textView.font = UIFont.systemFont(ofSize: 17)
            textView.scrollRangeToVisible(NSMakeRange(textView.text.characters.count, 1))
        }
        view.addSubview(contentTextView)

    }
    
    //MARK: event
    func releaseButtonDidTouch() {
        contentTextView.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }

}
