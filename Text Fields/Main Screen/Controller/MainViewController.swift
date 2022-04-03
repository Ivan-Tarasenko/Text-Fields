//
//  MainViewController.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 18.09.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    @IBOutlet weak var noDigitsView: CustomView!
    @IBOutlet weak var inputLimitView: CustomView!
    @IBOutlet weak var onlyCharactersView: CustomView!
    @IBOutlet weak var linkView: CustomView!
    @IBOutlet weak var validationRulesView: CustomView!

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var goTabBar: UIButton!

    let localString = Localization()
    let customPassValid = CustomPassValid()
    let screenTitle = ScreenTitle()

    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsView.settingView(type: .noDigits)
        inputLimitView.settingView(type: .inputLimit)
        onlyCharactersView.settingView(type: .onlyCharacters)
        linkView.settingView(type: .link)
        validationRulesView.settingView(type: .validationRules)

        createAccesibilityIdentifiersMainVC()
        setTitle()
        setTitleBackButton()
    }

    func setTitle() {
        screenTitle.title.textTitle = localString.titleLabelAll
        mainView.addSubview(screenTitle.title)
        screenTitle.title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(31)
            make.right.left.equalToSuperview().inset(16)
            make.bottom.equalTo(noDigitsView).inset(100)
        }
    }

    private func setTitleBackButton() {
        navigationItem.backButtonTitle = localString.titleLabelAll
    }
}
