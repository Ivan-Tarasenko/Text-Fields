//
//  TestOnlyChat.swift
//  Text FieldsUITests
//
//  Created by Иван Тарасенко on 12.12.2021.
//

import XCTest

class TestOnlyChat: XCTestCase {

    let accessibility = AccessibilityIdentifier()
    let accessibilityTB = AccessibilityIdentifierTabBar()

    var app: XCUIApplication!

    var goTabBar: XCUIElement!
    var tabBar: XCUIElement!
    var itemNoDigit: XCUIElement!
    var itemOnlyChar: XCUIElement!
    var titleLabel: XCUIElement!
    var onlyCharView: XCUIElement!
    var onlyCharTitle: XCUIElement!
    var onlyCharTextField: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        tabBar = app.tabBars[accessibilityTB.tabBar]
        goTabBar = app.buttons[accessibility.goTabBar]
        itemOnlyChar = tabBar.buttons[accessibilityTB.itemOnlyChar]
        itemNoDigit = tabBar.buttons[accessibilityTB.itemNoDigit]
        titleLabel = app.staticTexts[accessibility.titleLabel]
        onlyCharView = app.otherElements[accessibility.onlyCharactersView]
        onlyCharTitle = app.staticTexts[accessibility.onlyCharactersTitle]
        onlyCharTextField = app.textFields[accessibility.onlyCharactersTextField]
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemOnlyChar.tap()
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(onlyCharView.exists)
        XCTAssertTrue(onlyCharTitle.exists)
        XCTAssertTrue(onlyCharTextField.exists)
    }

    func testInputOnlyCharacters() {
        let stringInput = "Qwer13tyui12opE3bk45d79eer%3"
        let stringOut = "Qwert-12345"
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemOnlyChar.tap()
        onlyCharTextField.tap()
        onlyCharTextField.typeText(stringInput)
        XCTAssertEqual(onlyCharTextField.value as? String, stringOut)
    }
    
}
