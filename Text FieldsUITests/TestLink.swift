//
//  TestLink.swift
//  Text FieldsUITests
//
//  Created by Иван Тарасенко on 12.12.2021.
//

import XCTest

class TestLink: XCTestCase {

    let accessibility = AccessibilityIdentifier()
    let accessibilityTB = AccessibilityIdentifierTabBar()

    var app: XCUIApplication!

    var goTabBar: XCUIElement!
    var tabBar: XCUIElement!
    var itemNoDigit: XCUIElement!
    var itemLink: XCUIElement!
    var titleLabel: XCUIElement!
    var linkView: XCUIElement!
    var linkTitle: XCUIElement!
    var linkTextField: XCUIElement!
    var returnButton: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        returnButton = app.keyboards.buttons[accessibility.returnButton]
        tabBar = app.tabBars[accessibilityTB.tabBar]
        goTabBar = app.buttons[accessibility.goTabBar]
        itemLink = tabBar.buttons[accessibilityTB.itemLink]
        itemNoDigit = tabBar.buttons[accessibilityTB.itemNoDigit]
        titleLabel = app.staticTexts[accessibility.titleLabel]
        linkView = app.otherElements[accessibility.linkView]
        linkTitle = app.staticTexts[accessibility.linkTitle]
        linkTextField = app.textFields[accessibility.linkTextField]
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemLink.tap()
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(linkView.exists)
        XCTAssertTrue(linkTitle.exists)
        XCTAssertTrue(linkTextField.exists)
    }

    func testInputLink() {
        let stringInput = "That link https://www.google.com"
        let stringOut = "https://www.google.com"
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemLink.tap()
        linkTextField.tap()
        linkTextField.typeText(stringInput)
        returnButton.tap()
        app.activate() // <--- Go back to app
        XCTAssertEqual(linkTextField.value as? String, stringOut)
    }
}
