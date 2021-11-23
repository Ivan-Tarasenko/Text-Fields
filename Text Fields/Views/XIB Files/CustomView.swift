//
//  CustomView.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 19.09.2021.
//

import UIKit
import SnapKit

class CustomView: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var limitLabel: UILabel!

    var switchTextField: TextFields = .noDigits

    let model = Model()
    let text = Text()
    let customPassValid = CustomPassValid()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        textField.delegate = self

        addLabelPasswordValidation()
        addProgressBar()
        customPassValid.showLabelForPasswordValidetion = true
        customPassValid.progressView.isHidden = true
    }

    var setBorderForTextField: Bool = false {
       didSet {
           if setBorderForTextField {
               textField.setBorder(radius: 10, color: UIColor.systemBlue)
           } else {
               textField.setBorder(radius: 10, color: UIColor.systemGray6)
           }
       }
   }

    @IBAction func actionTextField(_ sender: UITextField) {
        let countCharacters = sender.string.count
        var text = sender.string

        switch switchTextField {
        case .inputLimit:
            let limit = model.limitChar
            limitLabel.textTitle = model.getLimit(string: text, limit: limit)
            if countCharacters > limit {
                textField.setBorder(radius: 10, color: UIColor.systemRed)
            } else {
                textField.setBorder(radius: 10, color: UIColor.systemBlue)
            }
        case .onlyCharacters:
            if !model.addSeparator, countCharacters == model.separatorIndex {
                text.append(model.separator)
            }
        case .validationRules:
            customPassValid.progressView.progress = 0
                                                                                // Check count character in string.
            if model.check(strung: text, checkCharacters: model.checkMinChar) {
                customPassValid.switchForMinChar = true
            } else {
                customPassValid.switchForMinChar = false
            }
                                                                                // Check minimum one digit.
            if model.check(strung: text, checkCharacters: model.checkDigit) {
                customPassValid.switchForMinOneDigit = true
            } else {
                customPassValid.switchForMinOneDigit = false
            }
                                                                                // Check minimum one lowercase character.
            if model.check(strung: text, checkCharacters: model.checkLowercase) {
                customPassValid.switchForMinOneLowercase = true
            } else {
                customPassValid.switchForMinOneLowercase = false
            }
                                                                                // Check minimum one capital required.
            if model.check(strung: text, checkCharacters: model.checkCapitalRequired) {
                customPassValid.switchForMinCapitalRequired = true
            } else {
                customPassValid.switchForMinCapitalRequired = false
            }
            
            model.progressBar(setProgressBar: customPassValid.progressView)
        default:
            break
        }
    }
    // MARK: - Configure CustomView
    func configureView() {
        guard let view = loadViewFromNib(nibName: "CustomView") else { return }
        view.frame = bounds
        addSubview(view)
    }
    // MARK: - Setting CustomView
    func settingView(type: TextFields) {
        switchTextField = type
        configureTextFields()
    }

    func addLabelPasswordValidation() {
        addSubview(customPassValid.minLengthChar)
        addSubview(customPassValid.minOneDigit)
        addSubview(customPassValid.minOneLowercase)
        addSubview(customPassValid.minCapitalRequired)
        customPassValid.setLabelPasswordValidation()
    }

    // MARK: - add progressBar to view.
    func addProgressBar() {
        addSubview(customPassValid.progressView)
        customPassValid.setProgressView()
    }

    // MARK: - configuration of individual views.
    func configureTextFields() {
        switch switchTextField {
        case .noDigits:
            textField.setDefaultBorder()
            title.textTitle = text.noDigit
            textField.placeholder = text.noDigitPlaceholder
        case .inputLimit:
            limitLabel.textTitle = "0/\(model.limitChar)"
            textField.setDefaultBorder()
            title.textTitle = text.inputLimit
            textField.placeholder = text.inputLimitPlaceholder
        case .onlyCharacters:
            textField.setDefaultBorder()
            title.textTitle = text.onlyCharacters
            textField.placeholder = text.onlyCharactersPlaceholder
            textField.autocapitalizationType = .words
        case .link:
            textField.setDefaultBorder()
            title.textTitle = text.link
            textField.placeholder = text.linkPlaceholder
        case .validationRules:
            textField.setDefaultBorder()
            title.textTitle = text.validationRules
            textField.placeholder = text.validationRulesPlaceholder
            textField.textContentType = .password
            textField.isSecureTextEntry = true
            customPassValid.showLabelForPasswordValidetion = false
        }
    }

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
}

extension CustomView: UITextFieldDelegate {

    // MARK: - Perform reverse by button "Return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if switchTextField == .link {
            linkUrl(url: detectedLink(string: textField.string))
        }
        self.endEditing(true)
        return false
    }

    // MARK: - Input tracking
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setBorderForTextField = true
        if switchTextField == .validationRules {
            customPassValid.progressView.isHidden = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        setBorderForTextField = false
        if customPassValid.progressView.progress == 0 {
            customPassValid.progressView.isHidden = true
        }
    }
    // MARK: - Working with regular expressions.
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String
    ) -> Bool {
        switch switchTextField {
        case .noDigits:
            let forbiddenCharacters = CharacterSet.decimalDigits.inverted
            let characterSet = CharacterSet(charactersIn: string)
            return forbiddenCharacters.isSuperset(of: characterSet)
        case .onlyCharacters:
            return model.validCharacter(text: textField.string + string,
                                        replacement: string
            )
        default:
            break
        }
        return true
    }
}
