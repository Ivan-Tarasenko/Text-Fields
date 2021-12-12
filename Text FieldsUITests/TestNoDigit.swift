//
//  TestNoDigit.swift
//  Text FieldsUITests
//
//  Created by Иван Тарасенко on 11.12.2021.
//

import XCTest

class TestNoDigit: XCTestCase {

    let accessibility = AccessibilityIdentifier()
    let accessibilityTB = AccessibilityIdentifierTabBar()
    var app: XCUIApplication!
    
    var tabBar: XCUIElement!
    var itemNoDigit: XCUIElement!
    var goTabBar: XCUIElement!
    var titleLabel: XCUIElement!

    var noDigitsView: XCUIElement!
    var noDigitsTitle: XCUIElement!
    var noDigitsTextField: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        tabBar = app.tabBars[accessibilityTB.tabBar]
        itemNoDigit = tabBar.buttons[accessibilityTB.itemNoDigit]
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
        app.swipeUp()
        goTabBar.tap()
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(noDigitsView.exists)
        XCTAssertTrue(noDigitsTitle.exists)
        XCTAssertTrue(noDigitsTextField.exists)
    }
    
    func testNoInputDigit() throws {
        let stringInput = "qwert123yu!@#"
        let stringOut = "qwertyu!@#"
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        noDigitsTextField.tap()
        noDigitsTextField.typeText(stringInput)
        XCTAssertEqual(noDigitsTextField.value as? String, stringOut)
    }
}
