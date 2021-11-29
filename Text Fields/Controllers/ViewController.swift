//
//  ViewController.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 18.09.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var noDigitsView: CustomView!
    @IBOutlet weak var inputLimitView: CustomView!
    @IBOutlet weak var onlyCharactersView: CustomView!
    @IBOutlet weak var linkView: CustomView!
    @IBOutlet weak var validationRulesView: CustomView!

    @IBOutlet weak var titleLabel: UILabel!

    let localizator = Localization()
    let changeLanguage = ChangeLanguage()

    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsView.settingView(type: .noDigits)
        inputLimitView.settingView(type: .inputLimit)
        onlyCharactersView.settingView(type: .onlyCharacters)
        linkView.settingView(type: .link)
        validationRulesView.settingView(type: .validationRules)

        setingChangeLanguage()
    }

    func localizationTitle() {
        titleLabel.textTitle = localizator.titleLabel
    }

    func setingChangeLanguage() {
        let constraintX = 50
        view.addSubview(changeLanguage.englishButton)
        view.addSubview(changeLanguage.russianButton)
        view.addSubview(changeLanguage.spanishButton)
        view.addSubview(changeLanguage.ukrainianButton)
        view.addSubview(changeLanguage.chineseButton)

        changeLanguage.englishButton.snp.makeConstraints { make in
            make.top.equalTo(validationRulesView).inset(170)
            make.left.equalToSuperview().inset(constraintX)
        }
        changeLanguage.russianButton.snp.makeConstraints { make in
            make.top.equalTo(validationRulesView).inset(170)
            make.left.equalTo(changeLanguage.englishButton).inset(constraintX)
        }
        changeLanguage.spanishButton.snp.makeConstraints { make in
            make.top.equalTo(validationRulesView).inset(170)
            make.left.equalTo(changeLanguage.russianButton).inset(constraintX)
        }
        changeLanguage.ukrainianButton.snp.makeConstraints { make in
            make.top.equalTo(validationRulesView).inset(170)
            make.left.equalTo(changeLanguage.spanishButton).inset(constraintX)
        }
        changeLanguage.chineseButton.snp.makeConstraints { make in
            make.top.equalTo(validationRulesView).inset(170)
            make.left.equalTo(changeLanguage.ukrainianButton).inset(constraintX)
        }

//        changeLanguage.buttonAction(sender: changeLanguage.russianButton)
    }
}
