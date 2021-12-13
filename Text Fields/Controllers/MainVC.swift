//
//  MainVC.swift
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

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var goTabBar: UIButton!

    //    let changeLanguage = ChangeLanguage()
    let localString = Localization()
    let customPassValid = CustomPassValid()
    let titleView = TitleView()

    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsView.settingView(type: .noDigits)
        inputLimitView.settingView(type: .inputLimit)
        onlyCharactersView.settingView(type: .onlyCharacters)
        linkView.settingView(type: .link)
        validationRulesView.settingView(type: .validationRules)

        createAccesibilityIdentifiersMainVC()
        setTitle()
    }

    func setTitle() {
        titleView.title.textTitle = localString.titleLabelAll
        mainView.addSubview(titleView.title)
        titleView.title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(31)
            make.right.left.equalToSuperview().inset(16)
            make.bottom.equalTo(noDigitsView).inset(100)
        }
    }
}
