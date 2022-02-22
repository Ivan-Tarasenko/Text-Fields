//
//  Text_FieldsUITests.swift
//  Text FieldsUITests
//
//  Created by Иван Тарасенко on 07.12.2021.
//

import XCTest
import Text_Fields

class TextFieldsUITests: XCTestCase {
    let accessibility = AccessibilityIdentifier()

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

    var returnButton: XCUIElement!

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
        inputLimitTextField = app.textFields[accessibility.inputLimitTextField]

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

        returnButton = app.keyboards.buttons[accessibility.returnButton]
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
        var stringInput = String()
        var stringOut = String()
        let localTitle = localizedString(key: "Text_Fields_All")
        let localStrInput = localizedString(key: "NoDigitstrInput")
        let localStrOut = localizedString(key: "NoDigitstrOut")

        if titleLabel.label == localTitle {
            stringInput = localStrInput
            stringOut = localStrOut
        }
        noDigitsTextField.tap()
        noDigitsTextField.typeText(stringInput)
        XCTAssertEqual(noDigitsTextField.value as? String, stringOut)
    }

    func testInputLimitCharacters() {
        var stringInput = String()
        var stringOut = String()
        let localTitle = localizedString(key: "Text_Fields_All")
        let localStrInput = localizedString(key: "limitStrInput")
        let localCount = localizedString(key: "limitStrInput")

        if titleLabel.label == localTitle {
            var countCharacter = localCount.count - 10
            stringInput = localStrInput
            if countCharacter < 0 {
                countCharacter = -countCharacter
                stringOut = "\(countCharacter)/10"
            } else {
                stringOut = "-\(countCharacter)/10"
            }
        }
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
        var stringInput = String()
        var stringOut = String()
        let localTitle = localizedString(key: "Text_Fields_All")
        let localStrInput = localizedString(key: "LinkString")

        if titleLabel.label == localTitle {
            stringInput = "\(localStrInput) https://www.google.com"
            stringOut = "https://www.google.com"
        }
        linkTextField.tap()
        linkTextField.typeText(stringInput)
        returnButton.tap()
        XCTAssertEqual(linkTextField.value as? String, stringOut)
    }

    func testRulesPasswordValidetion() {
        let stringInput = "123QWErty"
        let minOneDigitLoc = localizedString(key: "Min_1_digitTest")
        let minOneCapital = localizedString(key: "Min_1_capital_requiredTest")
        let minOneLowecase = localizedString(key: "Min_1_lowercaseTest")
        let minLength = localizedString(key: "Min_length_charactersTest")
        app.swipeUp()
        validationRulesTextField.tap()
        validationRulesTextField.typeText(stringInput)
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
        validationRulesTextField.tap()
        if app.buttons["Return"].label == "return" {
            app.buttons[localButtonTitle].tap()
        }
        validationRulesTextField.typeText(stringInput1)
        validationRulesTextField.typeText(stringInput2)
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
        validationRulesTextField.tap()
        validationRulesTextField.typeText("1111")
        XCTAssertEqual(progressView.value as? String, twentyFive)
        validationRulesTextField.typeText("Q")
        XCTAssertEqual(progressView.value as? String, fifty)
        validationRulesTextField.typeText("w")
        XCTAssertEqual(progressView.value as? String, seventyFive)
        validationRulesTextField.typeText("erty123")
        XCTAssertEqual(progressView.value as? String, hundred)
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

extension XCTest {
    // Geting localizatin strings.
    func localizedString(key: String) -> String {
        let localizationBundle = Bundle(path: Bundle(for: TextFieldsUITests.self).bundlePath)
        let result = NSLocalizedString(key, bundle: localizationBundle!, comment: "")
        return result
    }

}
