//
//  CustomPassValidation.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 09.12.2021.
//

import Foundation

extension CustomPassValid {

    func createAccesibilityIdentifiersPS() {
        minLengthChar.accessibilityIdentifier = "minLengthChar"
        minOneDigit.accessibilityIdentifier = "minOneDigit"
        minOneLowercase.accessibilityIdentifier = "minOneLowercase"
        minCapitalRequired.accessibilityIdentifier = "minCapitalRequired"
        notSpecialChar.accessibilityIdentifier = "notSpecialChar"
        onlyEnglishChar.accessibilityIdentifier = "onlyEnglishChar"

        progressView.accessibilityIdentifier = "progressView"
    }
}
