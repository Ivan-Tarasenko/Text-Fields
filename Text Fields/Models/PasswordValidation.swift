//
//  PasswordValidation.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 25.10.2021.
//

import UIKit

class PasswordValidation {
    
    var minLengthChar = UILabel()
    var minOneDigit = UILabel()
    var minOneLowercase = UILabel()
    var minCapitalRequired = UILabel()

    var progressInputPass = UIProgressView()

    var minLengthCharText = "- Min length 8 characters."
    var minOneDigitText = "- Min 1 digit."
    var minOneLowercaseText = "- Min 1 lowercase."
    var minCapitalRequiredText = "- Min 1 capital required."

    let checkMinChar = "[A-Za-z0-9]{8}"
    let checkDigit = "[0-9]"
    let checkLowercase = "[a-z]"
    let checkCapitalRequired = "[A-Z]"
    
    // MARK: - Setting for label.
    func setLabel(label: inout UILabel, text: String) {
        label.textTitle = text
        label.textAlignment = .left
        label.font = UIFont(name: "SF Pro Display", size: 13)
    }
    
    // MARK: - Minimum one digit.
    func checkCharacters(
        textField: UITextField,
        label: inout UILabel,
        progressBar: UIProgressView,
        text: String,
        check: String
    ) {
        if textField.string.range(of: check, options: .regularExpression) != nil {
            label.textColor = .systemGreen
            progressBar.progress += 0.25
            label.textTitle = text.replacingOccurrences(of: "-", with: "✓")
        } else {
            label.textColor = .black
            label.textTitle = text.replacingOccurrences(of: "✓", with: "-")
        }
    }

    // MARK: - Setting  progressBar.
    func progressBar(progressBar: UIProgressView) {
        switch progressBar.progress {
        case 0...0.25:
            progressBar.tintColor = .systemRed
        case 0.25...0.5:
            progressBar.tintColor = .systemOrange
        case 0.5...0.75:
            progressBar.tintColor = .systemYellow
        case 0.75...1:
            progressBar.tintColor = .systemGreen
        default:
            break
        }
    }
}
