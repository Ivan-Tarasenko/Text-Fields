//
//  ModelFields.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 22.10.2021.
//

import UIKit

enum TextFields {
    case noDigits
    case inputLimit
    case onlyCharacters
    case link
    case validationRules
}

// MARK: - onlyChar
class Model {
    let separator = "-"
    let separatorIndex = 5
    var isSeparatorAddad = false
    let maxOfCharacters = 11

    func isAllowedCharacter(text: String, replacement sting: String) -> Bool {
        var regex = String()
        let format = "SELF MATCHES %@"
        if text.count <= separatorIndex {
            regex = "[a-zA-Z]{1,5}"
            isSeparatorAddad = false
        } else if text.count <= maxOfCharacters {
            regex = "[a-zA-Z]{5}-[0-9]{0,5}"
            isSeparatorAddad = true
        }
        return sting.isEmpty || NSPredicate(format: format, regex).evaluate(with: text)
    }
}
