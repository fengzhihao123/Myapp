//
//  HomeRootViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/22.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class HomeRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }

    //MARK:Attribute
    func setupAttribute() {
        navigationItem.title = "首页"
        navigationController?.navigationBar.accessibilityIdentifier = "home"
        view.backgroundColor = UIColor.white
    }

}
