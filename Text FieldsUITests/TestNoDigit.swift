//
//  TestNoDigit.swift
//  Text FieldsUITests
//
//  Created by Иван Тарасенко on 11.12.2021.
//

import XCTest

class TestNoDigit: XCTestCase {

    let accessibility = AccessibilityIdentifier()

    var app: XCUIApplication!
    
    var tabBar: XCUIElement!
    var goTabBar: XCUIElement!
    var titleLabel: XCUIElement!

    var noDigitsView: XCUIElement!
    var noDigitsTitle: XCUIElement!
    var noDigitsTextField: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        tabBar = app.tabBars.element
        goTabBar = app.buttons[accessibility.goTabBar]
        titleLabel = app.staticTexts[accessibility.titleLabel]
        noDigitsView = app.otherElements[accessibility.noDigitsView]
        noDigitsTitle = app.staticTexts[accessibility.noDigitsTitle]
        noDigitsTextField = app.textFields[accessibility.noDigitsTextField]
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        goTabBar.tap()
        XCTAssertTrue(tabBar.exists)
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(noDigitsView.exists)
        XCTAssertTrue(noDigitsTitle.exists)
        XCTAssertTrue(noDigitsTextField.exists)
    }
    
    func testNoInputDigit() throws {
        let stringInput = "qwert123yu!@#"
        let stringOut = "qwertyu!@#"
        goTabBar.tap()
        tabBar.tap()
        noDigitsTextField.tap()
        noDigitsTextField.typeText(stringInput)
        XCTAssertEqual(noDigitsTextField.value as? String, stringOut)
    }
}
