//
//  LimitCharacter.swift
//  Text FieldsUITests
//
//  Created by Иван Тарасенко on 11.12.2021.
//

import XCTest

class LimitCharacter: XCTestCase {

    let accessibility = AccessibilityIdentifier()
    let accessibilityTB = AccessibilityIdentifierTabBar()

    var app: XCUIApplication!

    var goTabBar: XCUIElement!
    var tabBar: XCUIElement!
    var itemNoDigit: XCUIElement!
    var itemLimit: XCUIElement!
    var titleLabel: XCUIElement!
    var inputLimitView: XCUIElement!
    var inputLimitTitle: XCUIElement!
    var inputLimitLabel: XCUIElement!
    var inputLimitTextField: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        tabBar = app.tabBars[accessibilityTB.tabBar]
        goTabBar = app.buttons[accessibility.goTabBar]
        itemLimit = tabBar.buttons[accessibilityTB.itemLimitChar]
        itemNoDigit = tabBar.buttons[accessibilityTB.itemNoDigit]
        titleLabel = app.staticTexts[accessibility.titleLabel]
        inputLimitView = app.otherElements[accessibility.inputLimitView]
        inputLimitTitle = app.staticTexts[accessibility.inputLimitTitle]
        inputLimitLabel = app.staticTexts[accessibility.inputLimitLabel]
        inputLimitTextField = app.textFields[accessibility.inputLimitTextField]
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemLimit.tap()
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(inputLimitView.exists)
        XCTAssertTrue(inputLimitTitle.exists)
        XCTAssertTrue(inputLimitLabel.exists)
        XCTAssertTrue(inputLimitTextField.exists)
    }

    func testInputLimitCharacters() {
        let stringInput = "Checking limit character"
        let stringOut = "-14/10"
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemLimit.tap()
        inputLimitTextField.tap()
        inputLimitTextField.typeText(stringInput)
        XCTAssertEqual(inputLimitLabel.label, stringOut)
    }
}
