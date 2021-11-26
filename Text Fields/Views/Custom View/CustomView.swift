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
//    let text = Text()
    let customPassValid = CustomPassValid()
    let localizatoin = Localization()

    private let checkMinChar = "[A-Za-z0-9]{8}"
    private  let checkDigit = "[0-9]"
    private  let checkLowercase = "[a-z]"
    private  let checkCapitalRequired = "[A-Z]"

    private var tuneBorderForTextField: Bool = false {
        didSet {
            tuneBorderForTextField ?
            textField.setBorder(radius: 10, color: UIColor.systemBlue) :
            textField.setBorder(radius: 10, color: UIColor.systemGray6)

        }
    }

    private var tuneBorderFromFieldLimitChar: Bool = false {
        didSet {
            tuneBorderFromFieldLimitChar ?
            textField.setBorder(radius: 10, color: UIColor.systemRed) :
            textField.setBorder(radius: 10, color: UIColor.systemBlue)
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        textField.delegate = self

        addLabelPasswordValidation()
        addProgressBar()
        customPassValid.showLabelForPasswordValidetion = true
        customPassValid.progressView.isHidden = true
    }

// MARK: - Action for textField conected as editing changed
    @IBAction func actionTextField(_ sender: UITextField) {
        let countCharactersInString = sender.string.count
        var text = sender.string

        switch switchTextField {
            // MARK: - Rules for limit character and change border
        case .inputLimit:
            let limit = model.limitChar

            limitLabel.textTitle = model.getLimit(string: text, limit: limit)
            if countCharactersInString > limit {
                tuneBorderFromFieldLimitChar = true
            } else {
                tuneBorderFromFieldLimitChar = false
            }
            // MARK: - Add character "-"
        case .onlyCharacters:
            if !model.addSeparator, countCharactersInString == model.separatorIndex {
                text.append(model.separator)
            }
        case .validationRules:
            // MARK: - Checking the rules password validatin.
            customPassValid.progressView.progress = 0
            if text ~= checkMinChar {
                customPassValid.switchForMinChar = true
            } else {
                customPassValid.switchForMinChar = false
            }
            if text ~= checkDigit {
                customPassValid.switchForMinOneDigit = true
            } else {
                customPassValid.switchForMinOneDigit = false
            }
            if text ~= checkLowercase {
                customPassValid.switchForMinOneLowercase = true
            } else {
                customPassValid.switchForMinOneLowercase = false
            }
            if text ~= checkCapitalRequired {
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
    // MARK: - Added label for password validation
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
            title.textTitle = localizatoin.noDigit
            textField.placeholder = localizatoin.noDigitPlaceholder
        case .inputLimit:
            limitLabel.textTitle = "0/\(model.limitChar)"
            textField.setDefaultBorder()
            title.textTitle = localizatoin.limitChar
            textField.placeholder = localizatoin.limitCharPlaceholder
        case .onlyCharacters:
            textField.setDefaultBorder()
            title.textTitle = localizatoin.onlyChar
            textField.placeholder = localizatoin.onlyCharPlaceholder
            textField.autocapitalizationType = .words
        case .link:
            textField.setDefaultBorder()
            title.textTitle = localizatoin.link
            textField.placeholder = localizatoin.linkPlaceholder
        case .validationRules:
            textField.setDefaultBorder()
            title.textTitle = localizatoin.password
            textField.placeholder = localizatoin.passwordPlaceholder
            textField.textContentType = .password
            textField.isSecureTextEntry = true
            customPassValid.showLabelForPasswordValidetion = false
        }
    }
}

extension CustomView: UITextFieldDelegate {

    // MARK: - Perform reverse by button "Return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if switchTextField == .link {
            model.linkUrl(url: model.detectedLink(string: textField.string))
        }
        self.endEditing(true)
        return false
    }

    // MARK: - Input tracking
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tuneBorderForTextField = true
        if switchTextField == .validationRules {
            customPassValid.progressView.isHidden = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        tuneBorderForTextField = false
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
            return model.noDigit(string: string)
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
