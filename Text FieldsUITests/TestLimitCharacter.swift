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
        goTabBar = app.buttons[accessibility.goTabBar]
        itemLimit = app.buttons[accessibilityTB.itemLimitChar]
        itemNoDigit = app.buttons[accessibilityTB.itemNoDigit]
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
        var stringInput = String()
        var stringOut = String()
        let localTitle = localizedString(key: "Text_Fields_LimitChar")
        let localStrInput = localizedString(key: "limitStrInput")
        let localCount = localizedString(key: "limitStrInput")

        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemLimit.tap()

        if titleLabel.label == localTitle {
            var countCharacter = localCount.count - 10
            stringInput = localStrInput
            if countCharacter < 0 {
                countCharacter = -countCharacter
                stringOut = "\(countCharacter)/10"
            } else {
                stringOut = "-\(countCharacter)/10"
            }
        } else {
            print(accessibility.errorString)
        }
        inputLimitTextField.tap()
        inputLimitTextField.typeText(stringInput)
        XCTAssertEqual(inputLimitLabel.label, stringOut)
    }
}
