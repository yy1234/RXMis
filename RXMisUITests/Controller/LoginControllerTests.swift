//
//  LoginControllerTests.swift
//  RXMisUITests
//
//  Created by 杨洋 on 2021/9/9.
//

import XCTest

class LoginControllerTests: XCTestCase {

    override class func setUp() {
        
        XCUIApplication().launch()

        
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    /// 测试方法
    //每个测试方法是独立的
    //也就说执行每个测试方法前都会
    //安装一遍应用
    func testOther() {
        print("LoginControllerTests testOther")
    }
    
    func testLogin() {
        print("LoginControllerTests testLogin")
        //现在是登录界面
        //延时点击
        sleep(5)
        
        let app = XCUIApplication()
        
        let button = app.buttons["登录"]
        button.tap()
//        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).tap()
        sleep(2)
        
       let textField = app.textFields["请输入手机号/邮箱"]
        textField.tap()
        textField.typeText("13921434935")
        
        

        let passWordField = app.textFields["请输入密码"]
        sleep(1)
        passWordField.tap()
        passWordField.typeText("123456")

        
        
        let btn = app.buttons["登录"]
        btn.tap()
         
        
//        let textField = app.textFields["请输入手机号/邮箱"]
//        textField.tap()
//        textField.tap()
//        textField.tap()
//        textField.tap()
//        textField.tap()
//        textField.tap()
//        textField.tap()
//        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
//        let textField2 = app.textFields["请输入密码"]
//        textField2.tap()
//        textField2.tap()
//        button.tap()
//        button.tap()

         
    }

}
