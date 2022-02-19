//
//  NoDigitVC.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 11.12.2021.
//

import Foundation

extension NoDigit {

    func createAccesibilityIdentifiersNoDigitVC () {
        titleView.title.accessibilityIdentifier = "TextField_Title"
        customViewNoDigit.accessibilityIdentifier = "NoDigit_View"
        customViewNoDigit.title.accessibilityIdentifier = "NoDigit_Title"
        customViewNoDigit.textField.accessibilityIdentifier = "NoDigit_TextField"
    }
}
