//
//  IDElements.swift
//  Text FieldsUITests
//
//  Created by Иван Тарасенко on 09.12.2021.
//

import Foundation

struct AccessibilityIdentifier {

    let titleLabel = "TextField_Title"

    let noDigitsView = "NoDigit_View"
    let noDigitsTitle = "NoDigit_Title"
    let noDigitsTextField = "NoDigit_TextField"

    let inputLimitView = "InputLimit_Vew"
    let inputLimitTitle = "InputLimit_Title"
    let inputLimitLabel = "InputLimit_LimitLabel"
    let inputLimitTextField = "InputLimit_TextField"

    let onlyCharactersView = "OnlyChar_View"
    let onlyCharactersTitle = "OnlyChar_Title"
    let onlyCharactersTextField = "OnlyChar_TextField"

    let linkView = "Link_View"
    let linkTitle = "Link_Title"
    let linkTextField = "Link_TextField"

    let validationRulesView = "ValidationRules_View"
    let validationRulesTitle = "ValidationRules_Title"
    let validationRulesTextField = "ValidationRules_TextField"

    let progressView = "progressView"

    let minLengthChar = "minLengthChar"
    let minOneDigit = "minOneDigit"
    let minOneLowercase = "minOneLowercase"
    let minCapitalRequired = "minCapitalRequired"
    let notSpecialChar = "notSpecialChar"
    let onlyEnglishChar = "onlyEnglishChar"

    let goTabBar = "Button_TabBar"

    let returnButton = "Return"

    let nextKeyboard = "Next keyboard"

    let errorString = "change the language in the test settings: edit Scheme -> test"
}

struct AccessibilityIdentifierTabBar {

    let tabBar = "Tab Bar"
    let itemNoDigit = "NoDigit"
    let itemLimitChar = "Limit"
    let itemOnlyChar = "OnlyChar"
    let itemLink = "Link"
    let itemPassword = "Password"
}
