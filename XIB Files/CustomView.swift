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

    let limitChar = Limit()
    let passwordValidation = PasswordValidation()
    let text = Text()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        textField.delegate = self

        setLabelMinimumChar()
        setLabelMinOneDigit()
        setLabelMinOneLowercase()
        setLabelMinOneCapital()
        setProgressBar()

        passwordValidation.minLengthChar.isHidden = true
        passwordValidation.minOneDigit.isHidden = true
        passwordValidation.minOneLowercase.isHidden = true
        passwordValidation.minCapitalRequired.isHidden = true
        passwordValidation.progressInputPass.isHidden = true
  }

    @IBAction func actionTextField(_ sender: UITextField) {
        switch switchTextField {
        case .inputLimit:
            limitChar.limitCharacter(textField: sender, label: limitLabel)

        case .validationRules:
            passwordValidation.progressInputPass.progress = 0
            passwordValidation.checkNumberCharacter(
                textField: sender,
                label: &passwordValidation.minLengthChar,
                progressBar: passwordValidation.progressInputPass,
                text: passwordValidation.minLengthCharText,
                limitChar: passwordValidation.limitCharacter
            )
            passwordValidation.checkCharacters(
                textField: sender,
                label: &passwordValidation.minOneDigit,
                progressBar: passwordValidation.progressInputPass,
                text: passwordValidation.minOneDigitText,
                check: passwordValidation.checkDigit
            )
            passwordValidation.checkCharacters(
                textField: sender,
                label: &passwordValidation.minOneLowercase,
                progressBar: passwordValidation.progressInputPass,
                text: passwordValidation.minOneLowercaseText,
                check: passwordValidation.checkLowercase
            )
            passwordValidation.checkCharacters(
                textField: sender,
                label: &passwordValidation.minCapitalRequired,
                progressBar: passwordValidation.progressInputPass,
                text: passwordValidation.minCapitalRequiredText,
                check: passwordValidation.checkCapitalRequired
            )
            passwordValidation.progressBar(progressBar: passwordValidation.progressInputPass)
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
    // MARK: - add label to view: - Min length 8 characters.
    func setLabelMinimumChar() {
        passwordValidation.setLabel(
            label: &passwordValidation.minLengthChar,
            text: passwordValidation.minLengthCharText
        )
        addSubview(passwordValidation.minLengthChar)
        passwordValidation.minLengthChar.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(10)
            maker.top.equalTo(textField).inset(45)
        }
    }
    // MARK: - add label to view: - Min 1 digit.
    func setLabelMinOneDigit() {
        passwordValidation.setLabel(
            label: &passwordValidation.minOneDigit,
            text: passwordValidation.minOneDigitText
        )
        addSubview(passwordValidation.minOneDigit)
        passwordValidation.minOneDigit.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(10)
            maker.top.equalTo(passwordValidation.minLengthChar).inset(22)
        }
    }
    // MARK: - add label to view: - Min 1 lowercase.
    func setLabelMinOneLowercase() {
        passwordValidation.setLabel(
            label: &passwordValidation.minOneLowercase,
            text: passwordValidation.minOneLowercaseText
        )
        addSubview(passwordValidation.minOneLowercase)
        passwordValidation.minOneLowercase.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(10)
            maker.top.equalTo(passwordValidation.minOneDigit).inset(22)
        }
    }
    // MARK: - add label to view: - Min 1 capital required.
    func setLabelMinOneCapital() {
        passwordValidation.setLabel(
            label: &passwordValidation.minCapitalRequired,
            text: passwordValidation.minCapitalRequiredText
        )
        addSubview(passwordValidation.minCapitalRequired)
        passwordValidation.minCapitalRequired.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(10)
            maker.top.equalTo(passwordValidation.minOneLowercase).inset(22)
        }
    }

    // MARK: - add progressBar to view.
    func setProgressBar() {
        addSubview(passwordValidation.progressInputPass)
        passwordValidation.progressInputPass.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(2)
            maker.right.equalToSuperview().inset(2)
            maker.bottom.equalToSuperview().inset(0)
        }
    }

    // MARK: - configuration of individual views.
    func configureTextFields() {
        switch switchTextField {
        case .noDigits:
            textField.setDefaultBorder()
            title.textTitle = text.noDigit
            textField.placeholder = text.noDigitPlaceholder
        case .inputLimit:
            textField.setDefaultBorder()
            title.textTitle = text.inputLimit
            limitLabel.textTitle = text.limitCount
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
            passwordValidation.minLengthChar.isHidden = false
            passwordValidation.minOneDigit.isHidden = false
            passwordValidation.minOneLowercase.isHidden = false
            passwordValidation.minCapitalRequired.isHidden = false

        }
    }
    func linkUrl(url: String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)

    }
}

extension CustomView: UITextFieldDelegate {

    // MARK: - Perform reverse by button "Return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if switchTextField == .link {
            if textField.string.isValidURL {
                linkUrl(url: textField.string)
            }
        }
        self.endEditing(true)
        return false
    }

    // MARK: - Input tracking
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setBorder(radius: 10, color: UIColor.systemBlue)
        if switchTextField == .validationRules {
            passwordValidation.progressInputPass.isHidden = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setBorder(radius: 10, color: UIColor.systemGray6)
        if passwordValidation.progressInputPass.progress == 0 {
            passwordValidation.progressInputPass.isHidden = true
        }
    }
    // MARK: - Working with regular expressions.
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String
    ) -> Bool {

        let countCharacter = textField.string.count

        switch switchTextField {
        case .noDigits:
            let forbiddenCharacters = CharacterSet.decimalDigits.inverted
            let characterSet = CharacterSet(charactersIn: string)
            return forbiddenCharacters.isSuperset(of: characterSet)

        case .onlyCharacters:
            guard let textFieldText = textField.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            if countCharacter <= 12 {
                if countCharacter >= 5 {
                    let allowedCharacters = CharacterSet.decimalDigits
                    let characterSet = CharacterSet(charactersIn: string)
                    return allowedCharacters.isSuperset(of: characterSet)

                } else {
                    let allowedCharacters = CharacterSet.letters
                    let characterSet = CharacterSet(charactersIn: string)
                    return allowedCharacters.isSuperset(of: characterSet)
                }
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 12
        default:
            break
        }
        return true
    }
}
