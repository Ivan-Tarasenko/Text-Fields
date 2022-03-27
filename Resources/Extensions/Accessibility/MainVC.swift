//
//  MainVC.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 08.12.2021.
//

import Foundation

extension MainViewController {

    func createAccesibilityIdentifiersMainVC () {
        titleView.title.accessibilityIdentifier = "TextField_Title"

        noDigitsView.accessibilityIdentifier = "NoDigit_View"
        noDigitsView.title.accessibilityIdentifier = "NoDigit_Title"
        noDigitsView.textField.accessibilityIdentifier = "NoDigit_TextField"

        inputLimitView.accessibilityIdentifier = "InputLimit_Vew"
        inputLimitView.title.accessibilityIdentifier = "InputLimit_Title"
        inputLimitView.limitLabel.accessibilityIdentifier = "InputLimit_LimitLabel"
        inputLimitView.textField.accessibilityIdentifier = "InputLimit_TextField"

        onlyCharactersView.accessibilityIdentifier = "OnlyChar_View"
        onlyCharactersView.title.accessibilityIdentifier = "OnlyChar_Title"
        onlyCharactersView.textField.accessibilityIdentifier = "OnlyChar_TextField"

        linkView.accessibilityIdentifier = "Link_View"
        linkView.title.accessibilityIdentifier = "Link_Title"
        linkView.textField.accessibilityIdentifier = "Link_TextField"

        validationRulesView.accessibilityIdentifier = "ValidationRules_View"
        validationRulesView.title.accessibilityIdentifier = "ValidationRules_Title"
        validationRulesView.textField.accessibilityIdentifier = "ValidationRules_TextField"
        
        goTabBar.accessibilityIdentifier = "Button_TabBar"
    }

}
