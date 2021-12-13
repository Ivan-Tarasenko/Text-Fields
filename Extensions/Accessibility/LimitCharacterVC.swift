//
//  LimitCharacterVC.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 11.12.2021.
//

import Foundation

extension LimitCharacter {
    func createAccesibilityIdentifiersLimitVC () {
        titleView.title.accessibilityIdentifier = "TextField_Title"
        customViewLimit.accessibilityIdentifier = "InputLimit_Vew"
        customViewLimit.title.accessibilityIdentifier = "InputLimit_Title"
        customViewLimit.limitLabel.accessibilityIdentifier = "InputLimit_LimitLabel"
        customViewLimit.textField.accessibilityIdentifier = "InputLimit_TextField"
    }
}
