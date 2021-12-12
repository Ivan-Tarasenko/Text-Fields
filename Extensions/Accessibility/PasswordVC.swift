//
//  PasswordVC.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 12.12.2021.
//

import Foundation

extension PasswordValidation {

    func createAccesibilityIdentifiersPassVC () {
        titleView.title.accessibilityIdentifier = "TextField_Title"
        customViewPassValid.accessibilityIdentifier = "ValidationRules_View"
        customViewPassValid.title.accessibilityIdentifier = "ValidationRules_Title"
        customViewPassValid.textField.accessibilityIdentifier = "ValidationRules_TextField"
    }
}
