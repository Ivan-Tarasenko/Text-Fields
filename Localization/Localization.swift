//
//  Localization.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 26.11.2021.
//
import UIKit

class Localization {

    // Localization title.
    var titleLabelAll  = R.string.localizable.text_Fields_All()
    var titleLabelNoDigit  = R.string.localizable.text_Fields_NoDigit()
    var titleLabelLimit  = R.string.localizable.text_Fields_LimitChar()
    var titleLabelOnlyChar  = R.string.localizable.text_Fields_OnlyChar()
    var titleLabelLink  = R.string.localizable.text_Fields_Link()
    var titleLabelPass  = R.string.localizable.text_Fields_Password()

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
    let notSpecialChar = R.string.localizable.special_characters_are_not_allowed()
    let onlyEnglishChar = R.string.localizable.onlyEnglishCharacters()
}
