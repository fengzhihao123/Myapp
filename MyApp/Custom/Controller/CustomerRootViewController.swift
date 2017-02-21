//
//  CustomerRootViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/20.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class CustomerRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }

    //MARK: setup Attribute
    func setupAttribute() {
        view.backgroundColor = UIColor.white
        navigationItem.title = "客户"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
