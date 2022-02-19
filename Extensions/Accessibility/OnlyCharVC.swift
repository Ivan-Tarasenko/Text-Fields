//
//  OnlyCharVC.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 12.12.2021.
//

import Foundation

extension OnlyCharacter {

    func createAccesibilityIdentifiersOnlyCharVC () {
        titleView.title.accessibilityIdentifier = "TextField_Title"
        customViewOnlyChar.accessibilityIdentifier = "OnlyChar_View"
        customViewOnlyChar.title.accessibilityIdentifier = "OnlyChar_Title"
        customViewOnlyChar.textField.accessibilityIdentifier = "OnlyChar_TextField"
    }
}
