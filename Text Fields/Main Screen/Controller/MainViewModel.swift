//
//  Models.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 22.10.T2021.
//

import UIKit

class ModelTextField {

    // Text Fields.
    let noDigit = "NO Digits field"
    let noDigitPlaceholder = "Type here"

    let limitCharTitle = "Input limit"
    let limitCharPlaceholder = "Type here"

    let onlyChar = "Only characters"
    let onlyCharPlaceholder = "wwwww-ddddd"

    let link = "Link"
    let linkPlaceholder = "www.example.com"

    let password = "Validation rules"
    let passwordPlaceholder = "Password"

    // Title label password validation.
    let minChar = "- Min length 8 characters."
    let minOneDigit = "- Min 1 digit."
    let minOneLowercase = "- Min 1 lowercase."
    let minOneCapitalRequired = "- Min 1 capital required."
    let notSpecialChar = "✘ Special characters are not allowed"
    let onlyEnglishChar = "✘ Only English characters"

    // MARK: - No digits character
    func noDigit(string: String) -> Bool {
        let forbiddenCharacters = CharacterSet.decimalDigits.inverted
        let characterSet = CharacterSet(charactersIn: string)
        return forbiddenCharacters.isSuperset(of: characterSet)
    }

    // MARK: - Limit characters
    var limitChar = 10

    func getLimit (string: String, limit: Int) -> String {
        var countLimit = String()

        switch string.count {
        case nil:
            countLimit = "\(limit)/\(limit)"
        case 0...limit:
            countLimit = "\(limit - string.count)/\(limit)"
        case limit...string.count:
            countLimit = "\(limit - string.count)/\(limit)"
        default:
            break
        }
        return countLimit
    }

    func changeColorAfterLimit(string: String) -> NSMutableAttributedString {
        let mutableString = NSMutableAttributedString(string: string)
        if string.count > limitChar {
            mutableString.addAttribute(.foregroundColor,
                                       value: UIColor.black,
                                       range: NSRange(location: 0, length: limitChar)
            )
            mutableString.addAttribute(.foregroundColor,
                                       value: UIColor.red,
                                       range: NSRange(location: limitChar, length: string.count - limitChar)
            )
        }
        return mutableString
    }

    // MARK: - Only characters
    let separator = "-"
    let separatorIndex = 5
    var addSeparator = false
    let maxOfCharacters = 11

    func validCharacter(text: String, replacement sting: String) -> Bool {
        var regex = String()
        let format = "SELF MATCHES %@"
        if text.count <= separatorIndex {
            regex = "[a-zA-Z]{1,5}"
            addSeparator = false
        } else if text.count <= maxOfCharacters {
            regex = "[a-zA-Z]{5}-[0-9]{0,5}"
            addSeparator = true
        }
        return sting.isEmpty || NSPredicate(format: format, regex).evaluate(with: text)
    }

    // MARK: - link validity check and transition on it
    func linkUrl(url: String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    func detectedLink (string: String) -> String {
        let checkDomenName = "https://"
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count))
        var urlLink = String()
        for match in matches {
            guard let range = Range(match.range, in: string) else { continue }
            let url = string[range]
            urlLink = String(url)
            print(url)
        }
        if !(urlLink ~= checkDomenName) {
            urlLink.insert(contentsOf: "https://", at: urlLink.startIndex)
        }
        return urlLink
    }

    // MARK: - Rules password validation.
    func checkingPasswordRules(string: String, rule: String) -> Bool {
        string ~= rule
    }
    
    // MARK: - Tuning  progressBar.
    func progressBar(setProgressBar: UIProgressView) {
        switch setProgressBar.progress {
        case 0...0.25:
            setProgressBar.tintColor = .systemRed
        case 0.25...0.5:
            setProgressBar.tintColor = .systemOrange
        case 0.5...0.75:
            setProgressBar.tintColor = .systemYellow
        case 0.75...1:
            setProgressBar.tintColor = .systemGreen
        default:
            break
        }
    }
}
