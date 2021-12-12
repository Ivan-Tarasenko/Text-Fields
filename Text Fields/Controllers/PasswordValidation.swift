//
//  PasswordValidation.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class PasswordValidation: UIViewController {

    @IBOutlet weak var customViewPassValid: CustomView!
    @IBOutlet var mainView: UIView!

    let titleView = TitleView()
    let localString = Localization()

    override func viewDidLoad() {
        super.viewDidLoad()
        customViewPassValid.settingView(type: .validationRules)
        createAccesibilityIdentifiersPassVC()
        setTitle()
    }

    func setTitle() {
        titleView.title.textTitle = localString.titleLabelPass
        mainView.addSubview(titleView.title)
        titleView.setTitle()
    }
}
