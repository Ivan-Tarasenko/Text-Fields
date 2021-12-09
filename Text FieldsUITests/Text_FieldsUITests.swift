//
//  Text_FieldsUITests.swift
//  Text FieldsUITests
//
//  Created by Иван Тарасенко on 07.12.2021.
//

import XCTest

class TextFieldsUITests: XCTestCase {
let accessibility = AccessibilityIdentifierMainVC()

    var app: XCUIApplication!

    var titleLabel: XCUIElement!

    var noDigitsView: XCUIElement!
    var noDigitsTitle: XCUIElement!
    var noDigitsTextField: XCUIElement!

    var inputLimitView: XCUIElement!
    var inputLimitTitle: XCUIElement!
    var inputLimitLabel: XCUIElement!
    var inputLimitTextField: XCUIElement!

    var onlyCharactersView: XCUIElement!
    var onlyCharactersTitle: XCUIElement!
    var onlyCharactersTextField: XCUIElement!

    var linkView: XCUIElement!
    var linkTitle: XCUIElement!
    var linkTextField: XCUIElement!

    var validationRulesView: XCUIElement!
    var validationRulesTitle: XCUIElement!
    var validationRulesTextField: XCUIElement!

    var progressView: XCUIElement!

    var minLengthChar: XCUIElement!
    var minOneDigit: XCUIElement!
    var minOneLowercase: XCUIElement!
    var minCapitalRequired: XCUIElement!
    var notSpecialChar: XCUIElement!
    var onlyEnglishChar: XCUIElement!

    var goTabBar: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        titleLabel = app.staticTexts[accessibility.titleLabel]

        noDigitsView = app.otherElements[accessibility.noDigitsView]
        noDigitsTitle = app.staticTexts[accessibility.noDigitsTitle]
        noDigitsTextField = app.textFields[accessibility.noDigitsTextField]

        inputLimitView = app.otherElements[accessibility.inputLimitView]
        inputLimitTitle = app.staticTexts[accessibility.inputLimitTitle]
        inputLimitLabel = app.staticTexts[accessibility.inputLimitLabel]
        inputLimitTextField = app.textFields[accessibility.inputLimitViewTextField]

        onlyCharactersView = app.otherElements[accessibility.onlyCharactersView]
        onlyCharactersTitle = app.staticTexts[accessibility.onlyCharactersTitle]
        onlyCharactersTextField = app.textFields[accessibility.onlyCharactersTextField]

        linkView = app.otherElements[accessibility.linkView]
        linkTitle = app.staticTexts[accessibility.linkTitle]
        linkTextField = app.textFields[accessibility.linkTextField]

        validationRulesView = app.otherElements[accessibility.validationRulesView]
        validationRulesTitle = app.staticTexts[accessibility.validationRulesTitle]
        validationRulesTextField = app.secureTextFields[accessibility.validationRulesTextField]

        progressView = app.progressIndicators[accessibility.progressView]

        minLengthChar = app.staticTexts[accessibility.minLengthChar]
        minOneDigit = app.staticTexts[accessibility.minOneDigit]
        minOneLowercase = app.staticTexts[accessibility.minOneLowercase]
        minCapitalRequired = app.staticTexts[accessibility.minCapitalRequired]
        notSpecialChar = app.staticTexts[accessibility.notSpecialChar]
        onlyEnglishChar = app.staticTexts[accessibility.onlyEnglishChar]

        goTabBar = app.buttons[accessibility.goTabBar]

    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {

        XCTAssertTrue(titleLabel.exists)

        XCTAssertTrue(noDigitsView.exists)
        XCTAssertTrue(noDigitsTitle.exists)
        XCTAssertTrue(noDigitsTextField.exists)

        XCTAssertTrue(inputLimitView.exists)
        XCTAssertTrue(inputLimitTitle.exists)
        XCTAssertTrue(inputLimitLabel.exists)
        XCTAssertTrue(inputLimitTextField.exists)

        XCTAssertTrue(onlyCharactersView.exists)
        XCTAssertTrue(onlyCharactersTitle.exists)
        XCTAssertTrue(noDigitsTitle.exists)

        XCTAssertTrue(linkView.exists)
        XCTAssertTrue(linkTitle.exists)
        XCTAssertTrue(linkTextField.exists)

        XCTAssertTrue(validationRulesView.exists)
        XCTAssertTrue(validationRulesTitle.exists)
        XCTAssertTrue(validationRulesTextField.exists)

        XCTAssertTrue(minLengthChar.exists)
        XCTAssertTrue(minOneDigit.exists)
        XCTAssertTrue(minOneLowercase.exists)
        XCTAssertTrue(minCapitalRequired.exists)

        XCTAssertTrue(goTabBar.exists)
    }

    func testNoInputDigit() {
        let stringInput = "qwert123yu"
        let stringOut = "qwertyu"
        noDigitsTextField.tap()
        noDigitsTextField.typeText(stringInput)
        XCTAssertEqual(noDigitsTextField.value as? String, stringOut)
    }

    func testInputLimitCharacters() {
        let stringInput = "Checking limit character"
        let stringOut = "-14/10"
        inputLimitTextField.tap()
        inputLimitTextField.typeText(stringInput)
        XCTAssertEqual(inputLimitLabel.label, stringOut)
    }

    func testInputOnlyCharacters() {
        let stringInput = "Qwer13tyui12opE3bk45d79eer%3"
        let stringOut = "Qwert-12345"
        onlyCharactersTextField.tap()
        onlyCharactersTextField.typeText(stringInput)
        XCTAssertEqual(onlyCharactersTextField.value as? String, stringOut)
    }

    func testInputLink() {
        let stringInput = "That link https://www.google.com"
        let stringOut = "https://www.google.com"
        linkTextField.tap()
        linkTextField.typeText(stringInput)
        linkTitle.tap()
        XCTAssertEqual(linkTextField.value as? String, stringOut)
    }

    func testRulesPasswordValidetion() {
        let stringInput = "123QWErty"
        validationRulesTextField.tap()
        validationRulesTextField.typeText(stringInput)
        XCTAssertEqual(minOneDigit.label, "✓ Min 1 digit.")
        XCTAssertEqual(minCapitalRequired.label, "✓ Min 1 capital required.")
        XCTAssertEqual(minOneLowercase.label, "✓ Min 1 lowercase.")
        XCTAssertEqual(minLengthChar.label, "✓ Min length 8 characters.")
    }

   func testRulesPasswordValidationInputForbiddenCharacters() {
       let stringInput1 = "!АБВгде"
//       let stringInput2 = "АБВгде"
       validationRulesTextField.tap()
       app.buttons["Next keyboard"].tap()
       validationRulesTextField.typeText(stringInput1)
//       validationRulesTextField.typeText(stringInput2)
       XCTAssertTrue(notSpecialChar.exists)
       XCTAssertTrue(onlyEnglishChar.exists)
       XCTAssertEqual(notSpecialChar.label, "✘ Special characters are not allowed")
       XCTAssertEqual(onlyEnglishChar.label, "✘ Only English characters")

   }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
