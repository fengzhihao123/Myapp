//
//  CommonFile.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/20.
//  Copyright © 2017年 FZH. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import Then

// screen size
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
//UIView extension
extension UIView {
    var x: CGFloat { return self.frame.origin.x }
    var y: CGFloat { return self.frame.origin.y }
    var width: CGFloat { return self.frame.size.width }
    var height: CGFloat { return self.frame.size.height }
}
