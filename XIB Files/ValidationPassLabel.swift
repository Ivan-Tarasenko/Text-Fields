//
//  ValidationPassLabel.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 20.11.2021.
//

import UIKit

class LabelValidation {

    var minLengthChar = UILabel()
    var minOneDigit = UILabel()
    var minOneLowercase = UILabel()
    var minCapitalRequired = UILabel()

    var progressView = UIProgressView()

    var minLengthCharText = "- Min length 8 characters."
    var minOneDigitText = "- Min 1 digit."
    var minOneLowercaseText = "- Min 1 lowercase."
    var minCapitalRequiredText = "- Min 1 capital required."

    // MARK: - Setting for label.
    func setLabel(label: inout UILabel, text: String) {
        label.textTitle = text
        label.textAlignment = .left
        label.font = UIFont(name: "SF Pro Display", size: 13)
//        superview?.addSubview(label)
    }
}
