//
//  LimitCharacter.swift
//  Text FieldsUITests
//
//  Created by Иван Тарасенко on 11.12.2021.
//

import XCTest

class LimitCharacter: XCTestCase {

    let accessibility = AccessibilityIdentifier()

    var app: XCUIApplication!

    var goTabBar: XCUIElement!
    var tabBar: XCUIElement!
    var itemLimit:XCUIElement!
    var titleLabel: XCUIElement!

    var inputLimitView: XCUIElement!
    var inputLimitTitle: XCUIElement!
    var inputLimitLabel: XCUIElement!
    var inputLimitTextField: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        tabBar = app.tabBars.element
//        itemLimit = app.tabBars
        goTabBar = app.buttons[accessibility.goTabBar]
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
        goTabBar.tap()
        itemLimit.tap()
        XCTAssertTrue(tabBar.exists)
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(inputLimitView.exists)
        XCTAssertTrue(inputLimitTitle.exists)
        XCTAssertTrue(inputLimitLabel.exists)
        XCTAssertTrue(inputLimitTextField.exists)
    }

    func testInputLimitCharacters() {
        let stringInput = "Checking limit character"
        let stringOut = "-14/10"
        goTabBar.tap()
        itemLimit.tap()
        tabBar.tap()
        inputLimitTextField.tap()
        inputLimitTextField.typeText(stringInput)
        XCTAssertEqual(inputLimitLabel.label, stringOut)
    }
}
