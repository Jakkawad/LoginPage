//
//  LoginPageUITests.swift
//  LoginPageUITests
//
//  Created by admin on 3/22/2560 BE.
//  Copyright © 2560 Jakkawad.Chaiplee. All rights reserved.
//

import XCTest

class LoginPageUITests: XCTestCase {
        
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
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let loginElementsQuery = app.otherElements.containing(.button, identifier:"Login")
        let textField = loginElementsQuery.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("superae")
        
        let textField2 = loginElementsQuery.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("12345678")
        
        let loginButton = app.buttons["Login"]
        loginButton.tap()
        app.otherElements.containing(.staticText, identifier:"Login Fail").children(matching: .textField).element(boundBy: 1).typeText("9")
        loginButton.tap()
        
    }
    
}
