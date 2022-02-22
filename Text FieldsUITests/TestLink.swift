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
        goTabBar = app.buttons[accessibility.goTabBar]
        itemLink = app.buttons[accessibilityTB.itemLink]
        itemNoDigit = app.buttons[accessibilityTB.itemNoDigit]
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
        var stringInput = String()
        var stringOut = String()
        let localTitle = localizedString(key: "Text_Fields_Link")
        let localStrInput = localizedString(key: "LinkString")

        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemLink.tap()
        if titleLabel.label == localTitle {
            stringInput = "\(localStrInput) https://www.google.com"
            stringOut = "https://www.google.com"
        }
        linkTextField.tap()
        linkTextField.typeText(stringInput)
        returnButton.tap()
        XCTAssertEqual(linkTextField.value as? String, stringOut)
    }
}
