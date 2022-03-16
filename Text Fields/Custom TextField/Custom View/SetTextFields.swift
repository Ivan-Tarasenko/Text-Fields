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
    @IBOutlet weak var textField: TextField!
    @IBOutlet weak var limitLabel: UILabel!
    
    var switchTextField: TextFields = .noDigits
    let model = ModelTextField()
    let customPassValid = CustomPassValid()
    let localizing = Localization()
    
    private let checkMinChar = "[A-Za-z0-9]{8}"
    private let checkDigit = "[0-9]"
    private let checkLowercase = "[a-z]"
    private let checkCapitalRequired = "[A-Z]"
    private let checkSpecialChar = "[!-)@^*]"
    private let checkEnglishChar = "[а-яА-Я]"
    
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

    // Расскаментировать в случае использования без View в Storyboard //
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configureView()
//        textField.delegate = self
//
//        addLabelPasswordValidation()
//        addProgressBar()
//        customPassValid.showLabelForPasswordValidation = true
//        customPassValid.progressView.isHidden = true
//        customPassValid.showLabelForbiddenChar = true
//
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        textField.delegate = self

        addLabelPasswordValidation()
        addProgressBar()
        customPassValid.showLabelForPasswordValidation = true
        customPassValid.progressView.isHidden = true
        customPassValid.showLabelForbiddenChar = true

        customPassValid.createAccesibilityIdentifiersPS()
    }
    
    // MARK: - Action for textField connected as editing changed
    @IBAction func actionTextField(_ sender: UITextField) {
        let text = sender.string
        
        switch switchTextField {
        case .inputLimit:       //  - Rules for limit character and change border
            limitLabel.textTitle = model.getLimit(string: text, limit: model.limitChar)
            if text.count > model.limitChar {
                tuneBorderFromFieldLimitChar = true
            } else {
                tuneBorderFromFieldLimitChar = false
            }
            sender.attributedText = model.changeColorAfterLimit(string: sender.string)
            
        case .onlyCharacters:    //  - Add character "-"
            if !model.addSeparator, text.count == model.separatorIndex {
                sender.string.append(model.separator)
            }
        case .validationRules:   //  - Checking the rules password validation.
            passwordRules()
        default:
            break
        }
    }
    // MARK: - Configure CustomView
    func configureView() {
        guard let view = loadViewFromNib(nibName: "TextField") else { return }
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
        addSubview(customPassValid.notSpecialChar)
        addSubview(customPassValid.onlyEnglishChar)
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
//            textField.setDefaultBorder()
            title.textTitle = localizing.noDigit
//            textField.placeholder = localizing.noDigitPlaceholder
        case .inputLimit:
            limitLabel.textTitle = "\(model.limitChar)/\(model.limitChar)"
//            textField.setDefaultBorder()
            title.textTitle = localizing.limitCharTitle
//            textField.placeholder = localizing.limitCharPlaceholder
        case .onlyCharacters:
//            textField.setDefaultBorder()
            title.textTitle = localizing.onlyChar
//            textField.placeholder = localizing.onlyCharPlaceholder
//            textField.autocapitalizationType = .words
        case .link:
//            textField.setDefaultBorder()
            title.textTitle = localizing.link
//            textField.placeholder = localizing.linkPlaceholder
        case .validationRules:
//            textField.setDefaultBorder()
            title.textTitle = localizing.password
//            textField.placeholder = localizing.passwordPlaceholder
//            textField.textContentType = .password
//            textField.isSecureTextEntry = true
            customPassValid.showLabelForPasswordValidation = false
        }
    }
    // MARK: - Rules for check password input.
    func passwordRules() {
        let text = textField.string
        customPassValid.progressView.progress = 0

        if model.checkingPasswordRules(string: text, rule: checkMinChar) {
            customPassValid.switchForMinChar = true
        } else {
            customPassValid.switchForMinChar = false
        }

        if model.checkingPasswordRules(string: text, rule: checkDigit) {
            customPassValid.switchForMinOneDigit = true
        } else {
            customPassValid.switchForMinOneDigit = false
        }

        if model.checkingPasswordRules(string: text, rule: checkLowercase) {
            customPassValid.switchForMinOneLowercase = true
        } else {
            customPassValid.switchForMinOneLowercase = false
        }

        if model.checkingPasswordRules(string: text, rule: checkCapitalRequired) {
            customPassValid.switchForMinCapitalRequired = true
        } else {
            customPassValid.switchForMinCapitalRequired = false
        }

        if model.checkingPasswordRules(string: text, rule: checkSpecialChar) {
            customPassValid.notSpecialChar.isHidden = false
        } else {
            customPassValid.notSpecialChar.isHidden = true
        }

        if model.checkingPasswordRules(string: text, rule: checkEnglishChar) {
            customPassValid.onlyEnglishChar.isHidden = false
        } else {
            customPassValid.onlyEnglishChar.isHidden = true
        }
        
        model.progressBar(setProgressBar: customPassValid.progressView)
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
        if switchTextField == .link {
            guard !textField.string.isEmpty else { return }
            textField.string = model.detectedLink(string: textField.string)
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
