//
//  TestPassword.swift
//  Text FieldsUITests
//
//  Created by Иван Тарасенко on 12.12.2021.
//

import XCTest

class TestPassword: XCTestCase {

    let accessibility = AccessibilityIdentifier()
    let accessibilityTB = AccessibilityIdentifierTabBar()

    var app: XCUIApplication!

    var goTabBar: XCUIElement!
    var tabBar: XCUIElement!
    var itemNoDigit: XCUIElement!
    var itemPassword: XCUIElement!
    var titleLabel: XCUIElement!
    var passwordView: XCUIElement!
    var passwordTitle: XCUIElement!
    var passwordTextField: XCUIElement!

    var progressView: XCUIElement!

    var minLengthChar: XCUIElement!
    var minOneDigit: XCUIElement!
    var minOneLowercase: XCUIElement!
    var minCapitalRequired: XCUIElement!
    var notSpecialChar: XCUIElement!
    var onlyEnglishChar: XCUIElement!

    var switchKeyboardButton: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        tabBar = app.tabBars[accessibilityTB.tabBar]
        goTabBar = app.buttons[accessibility.goTabBar]
        itemPassword = tabBar.buttons[accessibilityTB.itemPassword]
        itemNoDigit = tabBar.buttons[accessibilityTB.itemNoDigit]
        titleLabel = app.staticTexts[accessibility.titleLabel]
        passwordView = app.otherElements[accessibility.validationRulesView]
        passwordTitle = app.staticTexts[accessibility.validationRulesTitle]
        passwordTextField = app.secureTextFields[accessibility.validationRulesTextField]

        progressView = app.progressIndicators[accessibility.progressView]

        minLengthChar = app.staticTexts[accessibility.minLengthChar]
        minOneDigit = app.staticTexts[accessibility.minOneDigit]
        minOneLowercase = app.staticTexts[accessibility.minOneLowercase]
        minCapitalRequired = app.staticTexts[accessibility.minCapitalRequired]
        notSpecialChar = app.staticTexts[accessibility.notSpecialChar]
        onlyEnglishChar = app.staticTexts[accessibility.onlyEnglishChar]
        switchKeyboardButton = app.buttons[accessibility.nextKeyboard]
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemPassword.tap()
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(passwordView.exists)
        XCTAssertTrue(passwordTitle.exists)
        XCTAssertTrue(passwordTextField.exists)
    }

    func testRulesPasswordValidetion() {
        let stringInput = "123QWErty"
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemPassword.tap()
        passwordTextField.tap()
        passwordTextField.typeText(stringInput)
        XCTAssertEqual(minOneDigit.label, "✓ Min 1 digit.")
        XCTAssertEqual(minCapitalRequired.label, "✓ Min 1 capital required.")
        XCTAssertEqual(minOneLowercase.label, "✓ Min 1 lowercase.")
        XCTAssertEqual(minLengthChar.label, "✓ Min length 8 characters.")
    }

   func testRulesPasswordValidationInputForbiddenCharacters() {
       let stringInput1 = "!@#"
       let stringInput2 = "АБВгде"
       app.swipeUp()
       goTabBar.tap()
       itemNoDigit.tap()
       itemPassword.tap()
       passwordTextField.tap()
       passwordTextField.typeText(stringInput1)
       switchKeyboardButton.tap()
       passwordTextField.typeText(stringInput2)
       switchKeyboardButton.tap()
       XCTAssertTrue(notSpecialChar.exists)
       XCTAssertTrue(onlyEnglishChar.exists)
       XCTAssertEqual(notSpecialChar.label, "✘ Special characters are not allowed")
       XCTAssertEqual(onlyEnglishChar.label, "✘ Only English characters")

   }

    func testCompletionProgressBar() {
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemPassword.tap()
        passwordTextField.tap()
        passwordTextField.typeText("1")
        XCTAssertEqual(progressView.value as? String, "25%")
        passwordTextField.typeText("Q")
        XCTAssertEqual(progressView.value as? String, "50%")
        passwordTextField.typeText("w")
        XCTAssertEqual(progressView.value as? String, "75%")
        passwordTextField.typeText("erty123")
        XCTAssertEqual(progressView.value as? String, "100%")
    }
}
