//
//  LoginTextField.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/22.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //光标颜色
        tintColor = UIColor.black
        //边框样式
        borderStyle = .roundedRect
        textColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
