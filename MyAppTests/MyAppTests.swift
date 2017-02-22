//
//  MyAppTests.swift
//  MyAppTests
//
//  Created by 冯志浩 on 2017/2/16.
//  Copyright © 2017年 FZH. All rights reserved.
//

import XCTest
@testable import MyApp

class MyAppTests: XCTestCase {
    var registerVC = RegisterViewController()
    let loginVC = LoginViewController()
    
    
    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginVCAlert() {
        
//        let _ = vc.view
//        vc.updateLabels(Float(80.0), Float(50.0), Float(40.0))
//        
//        // labels应该显示80, 50 and 40
//        XCTAssert(vc.numberLabel.text == "80.0", "numberLabel doesn't show the right text")
//        XCTAssert(vc.percentageLabel.text == "50.0%", "percentageLabel doesn't show the right text")
//        XCTAssert(vc.resultLabel.text == "40.0", "resultLabel doesn't show the right text")
    }
    
}
