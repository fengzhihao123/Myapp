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
//    MARK:RegisterViewController
//    account
    func testRegisterAccountAlert() {
        let app = XCUIApplication()
        app.buttons["前往注册"].tap()
        app.buttons["注册"].tap()
        
        let alerts = app.alerts
        let label = app.alerts.staticTexts["account is nil"]
        
        let alertCount = NSPredicate(format: "count == 1")
        let labelExist = NSPredicate(format: "exists == 1")
        
        expectation(for: alertCount, evaluatedWith: alerts, handler: nil)
        expectation(for: labelExist, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
//    password
    func testRegisterPassword() {
        let app = XCUIApplication()
        app.buttons["前往注册"].tap()
        let textField = app.textFields["registerAccount"]
        textField.tap()
        textField.typeText("13231852031")
        app.buttons["注册"].tap()
        
        let alerts = app.alerts
        let label = app.alerts.staticTexts["password is nil"]
        
        let alertCount = NSPredicate(format: "count == 1")
        let labelExist = NSPredicate(format: "exists == 1")
        
        expectation(for: alertCount, evaluatedWith: alerts, handler: nil)
        expectation(for: labelExist, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
//    测试注册成功
    func testRegisterSuccessfully() {
        let account = "13231852034"
        let password = "123456"

        let app = XCUIApplication()
        app.buttons["前往注册"].tap()
        let accountTextField = app.textFields["registerAccount"]
        accountTextField.tap()
        accountTextField.typeText(account)

        let passwordTextField = app.textFields["registerPassword"]
        passwordTextField.tap()
        passwordTextField.typeText(password)

        app.buttons["注册"].tap()
        XCTAssertEqual(app.navigationBars.element.identifier, "home")
    }
    
    
//    MARK:LoginViewController
//    测试登录页面账户为空的弹出框
    func testLoginAccoutnAlert() {
        let app = XCUIApplication()
        app.buttons["登录"].tap()
        
        let alerts = app.alerts
        let label = app.alerts.staticTexts["account is nil"]
        
        let alertCount = NSPredicate(format: "count == 1")
        let labelExist = NSPredicate(format: "exists == 1")
        
        expectation(for: alertCount, evaluatedWith: alerts, handler: nil)
        expectation(for: labelExist, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
//    测试登录页面密码为空的弹出框
    func testLoginPasswordAlert() {
        let app = XCUIApplication()
        let textField = app.textFields["account"]
        textField.tap()
        textField.typeText("13231852031")
        app.buttons["登录"].tap()
        
        let alerts = app.alerts
        let label = app.alerts.staticTexts["password is nil"]
        
        let alertCount = NSPredicate(format: "count == 1")
        let labelExist = NSPredicate(format: "exists == 1")
        
        expectation(for: alertCount, evaluatedWith: alerts, handler: nil)
        expectation(for: labelExist, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
//    测试点击登录按钮的跳转逻辑
    func testLoginSuccessfully() {
        let account = "13231852031"
        let password = "123456"
        
        let app = XCUIApplication()
        
        let accountTextField = app.textFields["account"]
        accountTextField.tap()
        accountTextField.typeText(account)
        
        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText(password)
        
        app.buttons["登录"].tap()
        XCTAssertEqual(app.navigationBars.element.identifier, "home")
    }
}
