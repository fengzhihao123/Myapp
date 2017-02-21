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
    
    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMessageLabel() {
        let _ = registerVC.view
        registerVC.buttonDidTouch()
        registerVC.accountTextfield.text = "13231852031"
        XCTAssert(registerVC.accountTextfield.text?.characters.count == 11, "account length is wrong")
        XCTAssert(registerVC.messageLabel.text == "message", "message label is wrong")
    }
    
}
