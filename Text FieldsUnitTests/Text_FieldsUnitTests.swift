//
//  Text_FieldsUnitTests.swift
//  Text FieldsUnitTests
//
//  Created by Иван Тарасенко on 05.12.2021.
//

import XCTest
@testable import Text_Fields

class TextFieldsUnitTests: XCTestCase {

    var sut: Model!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Model()
    }

    override func tearDownWithError() throws {
        sut = Model()
        try super.tearDownWithError()
    }

    // Test no digit.
    func testNoDigit() throws {
        let string1 = ""
        let string2 = "qwerty"
        let string3 = "123Fdf45"

        XCTAssertNotNil(sut.noDigit(string: string1))
        XCTAssertTrue(sut.noDigit(string: string2))
        XCTAssertFalse(sut.noDigit(string: string3))
    }

    // Test limit characters.
    func testLimitCharacters() throws {
        let limit = sut.limitChar
        let string = "qwerty"
        let limitNotExceeded = "4/\(limit)"
        let limitExceeded = "23/\(limit)"
        let limitChar = sut.getLimit(string: string, limit: limit)

        XCTAssertNotNil(limitChar)
        XCTAssertEqual(limitChar, limitNotExceeded)
        XCTAssertNotEqual(limitChar, limitExceeded)
    }

    // Only characters.
    func testValidationStringForOnlyCharacter() throws {
        let string0 = "0"
        let string1 = "qwert"
        let string2 = "123qw"
        let string3 = "qwert-12345"
        let string4 = "qwert-trewq"
        let string5 = "qwert-123456789"

        XCTAssertNotNil(sut.validCharacter(text: string1, replacement: string0))
        XCTAssertTrue(sut.validCharacter(text: string1, replacement: string0))
        XCTAssertFalse(sut.validCharacter(text: string2, replacement: string0))
        XCTAssertTrue(sut.validCharacter(text: string3, replacement: string0))
        XCTAssertFalse(sut.validCharacter(text: string4, replacement: string0))
        XCTAssertFalse(sut.validCharacter(text: string5, replacement: string0))
    }

    // Test link.
    func testDetectedLink() throws {
        let string1 = "there is a link here http://google.com"
        let string2 = "there isn't a link here http://google"
        let link = "http://google.com"
        let detect = sut.detectedLink(string: string1)

        XCTAssertNotNil(detect)
        XCTAssertEqual(sut.detectedLink(string: string1), link)
        XCTAssertNotEqual(sut.detectedLink(string: string2), link)
    }

    func testOpenLink() throws {
        let link = "http://google.com"
        try XCTUnwrap(sut.linkUrl(url: link))
    }

    // Test password validation.
    func test() {
        let checkOne = "[A-Za-z0-9]{8}"
        let checkTwo = "[0-9]"
        let checkThree = "[a-z]"
        let checkFour = "[A-Z]"

        let stringOne = ""
        let stringTwo = "Qwerty123"
        XCTAssertNotNil(sut.checkingPasswordRules(string:rule:))
        XCTAssertFalse(sut.checkingPasswordRules(string: stringOne, rule: checkOne))
        XCTAssertTrue(sut.checkingPasswordRules(string: stringTwo, rule: checkOne))

        XCTAssertFalse(sut.checkingPasswordRules(string: stringOne, rule: checkTwo))
        XCTAssertTrue(sut.checkingPasswordRules(string: stringTwo, rule: checkTwo))

        XCTAssertFalse(sut.checkingPasswordRules(string: stringOne, rule: checkThree))
        XCTAssertTrue(sut.checkingPasswordRules(string: stringTwo, rule: checkThree))

        XCTAssertFalse(sut.checkingPasswordRules(string: stringOne, rule: checkFour))
        XCTAssertTrue(sut.checkingPasswordRules(string: stringTwo, rule: checkFour))
    }
}
