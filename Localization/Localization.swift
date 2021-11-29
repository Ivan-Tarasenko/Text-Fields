//
//  Localization.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 26.11.2021.
//
import UIKit

protocol ChangeLanguageDelegate: AnyObject {
    func getData () -> String
}

class Localization {
    weak var changeLanguageDelegate: ChangeLanguageDelegate?
    
//    let language = ChangeLanguage()

    // Localization title.
    var titleLabel  = R.string.localizable.text_Fields(preferredLanguages: [""])

    // Localization Text Fields.
    let noDigit = R.string.localizable.no_Digits_field(preferredLanguages: [""])
    let noDigitPlaceholder = R.string.localizable.type_here(preferredLanguages: [""])

    let limitChar = R.string.localizable.input_limit(preferredLanguages: [""])
    let limitCharPlaceholder = R.string.localizable.type_here(preferredLanguages: [""])

    let onlyChar = R.string.localizable.only_characters(preferredLanguages: [""])
    let onlyCharPlaceholder = R.string.localizable.wwwww_ddddd(preferredLanguages: [""])

    let link = R.string.localizable.link(preferredLanguages: [""])
    let linkPlaceholder = R.string.localizable.wwwExampleCom(preferredLanguages: [""])

    let password = R.string.localizable.validation_rules(preferredLanguages: [""])
    let passwordPlaceholder = R.string.localizable.password(preferredLanguages: [""])

    // Localization label password validation.
    let minChar = R.string.localizable.min_length_characters(preferredLanguages: [""])
    let minOneDigit = R.string.localizable.min_1_digit(preferredLanguages: [""])
    let minOneLowercase = R.string.localizable.min_1_lowercase(preferredLanguages: [""])
    let minOneCapitalRequired = R.string.localizable.min_1_capital_required(preferredLanguages: [""])

    // Localization label and button changer laguage.
    let changeButton = R.string.localizable.change_languange(preferredLanguages: [""])
    let changeLabel = R.string.localizable.label_Change(preferredLanguages: [""])
}
