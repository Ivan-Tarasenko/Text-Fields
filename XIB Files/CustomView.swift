//
//  CustomView.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 19.09.2021.
//

import UIKit
import SnapKit
import Rswift

class CustomView: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var limitLabel: UILabel!

    var switchTextField: TextFields = .noDigits

    let model = Model()

    let text = Text()
    let labelValidation = LabelValidation()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        textField.delegate = self

        setLabelMinimumChar()
        setLabelMinOneDigit()
        setLabelMinOneLowercase()
        setLabelMinOneCapital()
        setProgressBar()

        labelValidation.minLengthChar.isHidden = true
        labelValidation.minOneDigit.isHidden = true
        labelValidation.minOneLowercase.isHidden = true
        labelValidation.minCapitalRequired.isHidden = true
        labelValidation.progressView.isHidden = true
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
            //            let range = (sender.string as NSString).range(of: sender.string)
            //            var atributedString = NSMutableAttributedString(string: sender.string)
            //            atributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
            //
            //            if sender.string.count >= 10 {
            //                sender.attributedText = atributedString
            //            }
        case .onlyCharacters:
            if !model.addSeparator, countCharacters == model.separatorIndex {
                text.append(model.separator)
            }
        case .validationRules:
            labelValidation.progressView.progress = 0

            // Check count character in string.
            if model.check(strung: text, checkCharacters: model.checkMinChar) {
                labelValidation.minLengthChar.textColor = .systemGreen
                labelValidation.progressView.progress += 0.25
                labelValidation.minLengthChar.textTitle =
                labelValidation.minLengthCharText.replacingOccurrences(of: "-", with: "✓")
            } else {
                labelValidation.minLengthChar.textColor = .black
                labelValidation.minLengthChar.textTitle =
                labelValidation.minLengthCharText.replacingOccurrences(of: "✓", with: "-")
            }
            // Check minimum one digit.
            if model.check(strung: text, checkCharacters: model.checkDigit) {
                labelValidation.minOneDigit.textColor = .systemGreen
                labelValidation.progressView.progress += 0.25
                labelValidation.minOneDigit.textTitle =
                labelValidation.minOneDigitText.replacingOccurrences(of: "-", with: "✓")
            } else {
                labelValidation.minOneDigit.textColor = .black
                labelValidation.minLengthChar.textTitle =
                labelValidation.minOneDigitText.replacingOccurrences(of: "✓", with: "-")
            }

            // Check minimum one lowercase character.
            if model.check(strung: text, checkCharacters: model.checkLowercase) {
                labelValidation.minOneLowercase.textColor = .systemGreen
                labelValidation.progressView.progress += 0.25
                labelValidation.minOneLowercase.textTitle =
                labelValidation.minOneLowercaseText.replacingOccurrences(of: "-", with: "✓")
            } else {
                labelValidation.minOneLowercase.textColor = .black
                labelValidation.minLengthChar.textTitle =
                labelValidation.minOneLowercaseText.replacingOccurrences(of: "✓", with: "-")
            }

            // Check minimum one capital required.
            if model.check(strung: text, checkCharacters: model.checkCapitalRequired) {
                labelValidation.minCapitalRequired.textColor = .systemGreen
                labelValidation.progressView.progress += 0.25
                labelValidation.minCapitalRequired.textTitle =
                labelValidation.minCapitalRequiredText.replacingOccurrences(of: "-", with: "✓")
            } else {
                labelValidation.minCapitalRequired.textColor = .black
                labelValidation.minLengthChar.textTitle =
                labelValidation.minCapitalRequiredText.replacingOccurrences(of: "✓", with: "-")
            }

            model.progressBar(progressBar: labelValidation.progressView)
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
        labelValidation.setLabel(
            label: &labelValidation.minLengthChar,
            text: labelValidation.minLengthCharText
        )
        addSubview(labelValidation.minLengthChar)
        labelValidation.minLengthChar.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(10)
            maker.top.equalTo(textField).inset(45)
        }
    }
    // MARK: - add label to view: - Min 1 digit.
    func setLabelMinOneDigit() {
        labelValidation.setLabel(
            label: &labelValidation.minOneDigit,
            text: labelValidation.minOneDigitText
        )
        addSubview(labelValidation.minOneDigit)
        labelValidation.minOneDigit.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(10)
            maker.top.equalTo(labelValidation.minLengthChar).inset(22)
        }
    }
    // MARK: - add label to view: - Min 1 lowercase.
    func setLabelMinOneLowercase() {
        labelValidation.setLabel(
            label: &labelValidation.minOneLowercase,
            text: labelValidation.minOneLowercaseText
        )
        addSubview(labelValidation.minOneLowercase)
        labelValidation.minOneLowercase.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(10)
            maker.top.equalTo(labelValidation.minOneDigit).inset(22)
        }
    }
    // MARK: - add label to view: - Min 1 capital required.
    func setLabelMinOneCapital() {
        labelValidation.setLabel(
            label: &labelValidation.minCapitalRequired,
            text: labelValidation.minCapitalRequiredText
        )
        addSubview(labelValidation.minCapitalRequired)
        labelValidation.minCapitalRequired.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(10)
            maker.top.equalTo(labelValidation.minOneLowercase).inset(22)
        }
    }

    // MARK: - add progressBar to view.
    func setProgressBar() {
        addSubview(labelValidation.progressView)
        labelValidation.progressView.snp.makeConstraints { maker in
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
            labelValidation.minLengthChar.isHidden = false
            labelValidation.minOneDigit.isHidden = false
            labelValidation.minOneLowercase.isHidden = false
            labelValidation.minCapitalRequired.isHidden = false

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
        textField.setBorder(radius: 10, color: UIColor.systemBlue)
        if switchTextField == .validationRules {
            labelValidation.progressView.isHidden = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setBorder(radius: 10, color: UIColor.systemGray6)
        if labelValidation.progressView.progress == 0 {
            labelValidation.progressView.isHidden = true
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
