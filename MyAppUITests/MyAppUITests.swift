//
//  MyAppUITests.swift
//  MyAppUITests
//
//  Created by 冯志浩 on 2017/2/16.
//  Copyright © 2017年 FZH. All rights reserved.
//

import XCTest

class MyAppUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmpty() {
    
    }
    
    func testRegisterSegueSuccessly() {
//        let userName = "onevcat"
//        let password = "123"
//        
//        let app = XCUIApplication()
//        
//        let userNameTextField = app.textFields["username"]
//        userNameTextField.tap()
//        userNameTextField.typeText(userName)
//        
//        let passwordTextField = app.secureTextFields["password"]
//        passwordTextField.tap()
//        passwordTextField.typeText(password)
//        
//        app.buttons["Login"].tap()
//        
//        let navTitle = app.navigationBars[userName].staticTexts[userName]
//        expectationForPredicate(NSPredicate(format: "exists == 1"), evaluatedWithObject: navTitle, handler: nil)
//        
//        waitForExpectationsWithTimeout(5, handler: nil)
//        let app = XCUIApplication()
//        app.buttons["register"].tap()
//        XCTAssertEqual(app.navigationBars.element.identifier, "Menu")
        
    }
    
}
