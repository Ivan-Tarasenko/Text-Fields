//
//  Localization.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 26.11.2021.
//

import Foundation
import UIKit

class Localization {

    let language = ChangeLanguage()

    // Localization title.
    let titleLabel  = R.string.localizable.text_Fields(preferredLanguages: [])

    // Localization Text Fields.
    let noDigit = R.string.localizable.no_Digits_field()
    let noDigitPlaceholder = R.string.localizable.type_here()

    let limitChar = R.string.localizable.input_limit()
    let limitCharPlaceholder = R.string.localizable.type_here()

    let onlyChar = R.string.localizable.only_characters()
    let onlyCharPlaceholder = R.string.localizable.wwwww_ddddd()

    let link = R.string.localizable.link()
    let linkPlaceholder = R.string.localizable.wwwExampleCom()

    let password = R.string.localizable.validation_rules()
    let passwordPlaceholder = R.string.localizable.password()

    // Localization label password validation.
    let minChar = R.string.localizable.min_length_characters()
    let minOneDigit = R.string.localizable.min_1_digit()
    let minOneLowercase = R.string.localizable.min_1_lowercase()
    let minOneCapitalRequired = R.string.localizable.min_1_capital_required()

    // Localization label and button changer laguage.
    let changeButton = R.string.localizable.change_languange()
    let changeLabel = R.string.localizable.label_Change()
}
