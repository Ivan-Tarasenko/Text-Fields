//
//  Localization.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 26.11.2021.
//

import Foundation
import UIKit

class Localization {
    // Localization title.
    let titleLabel  = NSLocalizedString(R.string.localizable.text_Fields(), comment: "")

    // Localization Text Fields.
    let noDigit = NSLocalizedString(R.string.localizable.no_Digits_field(), comment: "")
    let noDigitPlaceholder = NSLocalizedString(R.string.localizable.type_here(), comment: "")

    let limitChar = NSLocalizedString(R.string.localizable.input_limit(), comment: "")
    let limitCharPlaceholder = NSLocalizedString(R.string.localizable.type_here(), comment: "")

    let onlyChar = NSLocalizedString(R.string.localizable.only_characters(), comment: "")
    let onlyCharPlaceholder = NSLocalizedString(R.string.localizable.wwwww_ddddd(), comment: "")

    let link = NSLocalizedString(R.string.localizable.link(), comment: "")
    let linkPlaceholder = NSLocalizedString(R.string.localizable.wwwExampleCom(), comment: "")

    let password = NSLocalizedString(R.string.localizable.validation_rules(), comment: "")
    let passwordPlaceholder = NSLocalizedString(R.string.localizable.password(), comment: "")

    // Localization label password validation.
    let minChar = NSLocalizedString(R.string.localizable.min_length_characters(), comment: "")
    let minOneDigit = NSLocalizedString(R.string.localizable.min_1_digit(), comment: "")
    let minOneLowercase = NSLocalizedString(R.string.localizable.min_1_lowercase(), comment: "")
    let minOneCapitalRequired = NSLocalizedString(R.string.localizable.min_1_capital_required(), comment: "")

    // Localization label and button changer laguage.
    let changeButton = NSLocalizedString(R.string.localizable.change_languange(), comment: "")
    let changeLabel = NSLocalizedString(R.string.localizable.label_Change(), comment: "")
}
