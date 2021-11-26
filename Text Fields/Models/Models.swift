//
//  Models.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 22.10.2021.
//

import UIKit

// MARK: - Listing of all text fields.
enum TextFields {
    case noDigits
    case inputLimit
    case onlyCharacters
    case link
    case validationRules
}

class Model {

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
            countLimit = "0/\(limit)"
        case 0...limit:
            countLimit = "\(string.count)/\(limit)"
        case limit...string.count:
            countLimit = "\(limit - string.count)/\(limit)"
        default:
            break
        }
        return countLimit
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

    // MARK: - link validaty check and transition on it
    func linkUrl(url: String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)

    }

    func detectedLink (string: String) -> String {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count))
        var urlLink = String()
        for match in matches {
            guard let range = Range(match.range, in: string) else { continue }
            let url = string[range]
            urlLink = String(url)
            print(url)
        }
        return urlLink
    }
    
    // MARK: - Tuneing  progressBar.
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
