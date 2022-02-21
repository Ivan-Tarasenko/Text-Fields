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
        goTabBar = app.buttons[accessibility.goTabBar]
        itemPassword = app.buttons[accessibilityTB.itemPassword]
        itemNoDigit = app.buttons[accessibilityTB.itemNoDigit]
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
        let minOneDigitLoc = localizedString(key: "Min_1_digitTest")
        let minOneCapital = localizedString(key: "Min_1_capital_requiredTest")
        let minOneLowecase = localizedString(key: "Min_1_lowercaseTest")
        let minLength = localizedString(key: "Min_length_charactersTest")
        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemPassword.tap()
        passwordTextField.tap()
        passwordTextField.typeText(stringInput)
        XCTAssertEqual(minOneDigit.label, minOneDigitLoc)
        XCTAssertEqual(minCapitalRequired.label, minOneCapital)
        XCTAssertEqual(minOneLowercase.label, minOneLowecase)
        XCTAssertEqual(minLengthChar.label, minLength)
    }

   func testRulesPasswordValidationInputForbiddenCharacters() {
       let stringInput1 = "!@#"
       let stringInput2 = "АБВгде"
       let localButtonTitle = localizedString(key: "NextKeyboard")
       let localStrInput = localizedString(key: "special_characters_are_not_allowed")
       let localStrOut = localizedString(key: "only English characters")

       app.swipeUp()
       goTabBar.tap()
       itemNoDigit.tap()
       itemPassword.tap()
       passwordTextField.tap()
       if app.buttons["Return"].label == "return" {
           app.buttons[localButtonTitle].tap()
       }
       passwordTextField.typeText(stringInput1)
       passwordTextField.typeText(stringInput2)
       XCTAssertTrue(notSpecialChar.exists)
       XCTAssertTrue(onlyEnglishChar.exists)
       XCTAssertEqual(notSpecialChar.label, localStrInput)
       XCTAssertEqual(onlyEnglishChar.label, localStrOut)
   }

    func testCompletionProgressBar() {
        let twentyFive = localizedString(key: "25%")
        let fifty = localizedString(key: "50%")
        let seventyFive = localizedString(key: "75%")
        let hundred = localizedString(key: "100%")

        app.swipeUp()
        goTabBar.tap()
        itemNoDigit.tap()
        itemPassword.tap()
        passwordTextField.tap()
        passwordTextField.typeText("1111")
        XCTAssertEqual(progressView.value as? String, twentyFive)
        passwordTextField.typeText("Q")
        XCTAssertEqual(progressView.value as? String, fifty)
        passwordTextField.typeText("w")
        XCTAssertEqual(progressView.value as? String, seventyFive)
        passwordTextField.typeText("erty123")
        XCTAssertEqual(progressView.value as? String, hundred)
    }
}
