//
//  LoginUITests.swift
//  TestUITests
//
//  Created by Josean Donato Jaulis Nina on 3/03/22.
//

import XCTest

class LoginUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginSuccess() throws {
        
        self.openLoginScreen()
        
        let txfUsername = app.textFields["Login.TextField.Username"]
        XCTAssert(txfUsername.exists)
        txfUsername.tap()
        app.keys["t"].tap()
        app.keys["e"].tap()
        app.keys["s"].tap()
        app.keys["t"].tap()
        
        
        let btnLogin = app.buttons["Login.UIButton.Login"]
        XCTAssert(btnLogin.exists)
        XCTAssertEqual(btnLogin.label, "Aceptar")
        btnLogin.tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLoginCancel() throws {
        
        self.openLoginScreen()
        
        let btnCancel = app.buttons["Login.UIButton.Cancel"]
        XCTAssert(btnCancel.exists)
        XCTAssertEqual(btnCancel.label, "Cancelar")
        btnCancel.tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func openLoginScreen(){
        
        let nameCell = app.staticTexts["Login Simple UITest"]
        XCTAssert(nameCell.exists)
        
        nameCell.tap()
    }

}
