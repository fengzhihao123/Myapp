//
//  ChooseRootVCHandle.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/21.
//  Copyright © 2017年 FZH. All rights reserved.
//

import Foundation
import UIKit


let navigationControl = UINavigationController()
let rootVC = HomeRootViewController()
let aboutmeVC = AboutMeRootViewController()
let customerVC = CustomerRootViewController()
let loginVC = LoginViewController()

func chooseRootVC() {
    let application = UIApplication.shared.delegate as! AppDelegate
    if UserDefaults.standard.string(forKey: "UserToken") != nil {
        let tabbarControl = UITabBarController()
        let aboutmeNavi = UINavigationController(rootViewController: aboutmeVC)
        aboutmeNavi.tabBarItem.title = "我的"
        navigationControl.addChildViewController(rootVC)
        navigationControl.tabBarItem.title = "首页"
        let customerNavi = UINavigationController(rootViewController: customerVC)
        customerNavi.tabBarItem.title = "客户"
        
        tabbarControl.addChildViewController(navigationControl)
        tabbarControl.addChildViewController(customerNavi)
        tabbarControl.addChildViewController(aboutmeNavi)
       application.window?.rootViewController = tabbarControl
    }else {
        let LoginNavi = UINavigationController(rootViewController: loginVC)
       application.window?.rootViewController = LoginNavi
    }
}
