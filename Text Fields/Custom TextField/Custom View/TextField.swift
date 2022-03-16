//
//  TextField.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 16.03.2022.
//

import UIKit

class TextField: UITextField {

//    override func draw(_ rect: CGRect) {
//        
//    }

    var switchTextField: TextFields = .noDigits
    let localizing = Localization()

    // MARK: - configuration of individual views.
    func configureTextFields() {
        switch switchTextField {
        case .noDigits:
            self.setDefaultBorder()
//            title.textTitle = localizing.noDigit
            self.placeholder = localizing.noDigitPlaceholder
        case .inputLimit:
//            limitLabel.textTitle = "\(model.limitChar)/\(model.limitChar)"
            self.setDefaultBorder()
//            title.textTitle = localizing.limitCharTitle
            self.placeholder = localizing.limitCharPlaceholder
        case .onlyCharacters:
            self.setDefaultBorder()
//            title.textTitle = localizing.onlyChar
            self.placeholder = localizing.onlyCharPlaceholder
            self.autocapitalizationType = .words
        case .link:
            self.setDefaultBorder()
//            title.textTitle = localizing.link
            self.placeholder = localizing.linkPlaceholder
        case .validationRules:
            self.setDefaultBorder()
//            title.textTitle = localizing.password
            self.placeholder = localizing.passwordPlaceholder
            self.textContentType = .password
            self.isSecureTextEntry = true
//            customPassValid.showLabelForPasswordValidation = false
        }
    }
}
