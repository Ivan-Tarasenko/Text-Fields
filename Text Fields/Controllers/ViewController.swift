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
        view.addSubview(changeLanguage.changeButton)
        view.addSubview(changeLanguage.changeLabel)
        changeLanguage.changeButton.snp.makeConstraints { make in
            make.top.equalTo(validationRulesView).inset(170)
            make.left.equalToSuperview().inset(30)
        }
        changeLanguage.changeLabel.snp.makeConstraints { make in
            make.top.top.equalTo(validationRulesView).inset(172)
            make.left.equalTo(changeLanguage.changeButton).inset(160)
        }
        changeLanguage.buttonAction(sender: changeLanguage.changeButton)
    }
}
