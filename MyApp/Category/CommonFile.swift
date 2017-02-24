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
//color category
extension UIColor{
    class func colorWithHexString(_ color: String,alpha: CGFloat) -> UIColor {
        
        var colorStr = color
        let length = colorStr.lengthOfBytes(using: String.Encoding.utf8)
        
        if length < 6 {
            return UIColor.clear
        }
        if colorStr.hasPrefix("0X") {
            colorStr = colorStr.substring(from: "0X".endIndex)
        }
        if colorStr.hasPrefix("#") {
            colorStr = colorStr.substring(from: "#".endIndex)
        }
        //    red
        let redIndex = colorStr.index(colorStr.startIndex, offsetBy: 2)
        let redStr = String(colorStr[colorStr.startIndex..<redIndex])
        //    green
        let greenIndex = colorStr.index("11".endIndex, offsetBy: 2)
        let greenStr = String(colorStr["11".endIndex...greenIndex])
        //    blue
        let blueIndex = colorStr.index("1111".endIndex, offsetBy: 2)
        let blueStr = String(colorStr["1111".endIndex...blueIndex])
        
        var r: UInt32 = 1
        var g: UInt32 = 1
        var b: UInt32 = 1
        
        Scanner.init(string: redStr!).scanHexInt32(&r)
        Scanner.init(string: greenStr!).scanHexInt32(&g)
        Scanner.init(string: blueStr!).scanHexInt32(&b)
        
        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
    class func colorWithHexString(_ color: String) -> UIColor {
        return self.colorWithHexString(color, alpha: 1.0)
    }
}
