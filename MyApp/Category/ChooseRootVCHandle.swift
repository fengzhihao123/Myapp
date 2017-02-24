//
//  ChooseRootVCHandle.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/21.
//  Copyright © 2017年 FZH. All rights reserved.
//

import Foundation
import UIKit

let homerootVC = HomeRootViewController()
let aboutmeVC = AboutMeRootViewController()
let customerVC = CustomerRootViewController()
let loginVC = LoginViewController()

func chooseRootVC() {
    let application = UIApplication.shared.delegate as! AppDelegate
    if UserDefaults.standard.string(forKey: "UserToken") != nil {
        let tabBarRootVC = FZHTabbarViewController()
        setupTabbarRootVC(tabBarRootVC: tabBarRootVC)
        application.window?.rootViewController = tabBarRootVC
    }else {
        let LoginNavi = UINavigationController(rootViewController: loginVC)
        application.window?.rootViewController = LoginNavi
    }
}

func setupTabbarRootVC(tabBarRootVC: FZHTabbarViewController) {
    tabBarRootVC.setupChildVC(homerootVC, title: "首页", imageName: "first", selectImageName: "first_select", isAnimation: TabbarHideStyle.tabbarHideWithNoAnimation)
    tabBarRootVC.setupChildVC(customerVC, title: "客户", imageName: "second", selectImageName: "second_select", isAnimation: TabbarHideStyle.tabbarHideWithNoAnimation)
    tabBarRootVC.setupChildVC(aboutmeVC, title: "我的", imageName: "third", selectImageName: "third_select", isAnimation: TabbarHideStyle.tabbarHideWithNoAnimation)
}
