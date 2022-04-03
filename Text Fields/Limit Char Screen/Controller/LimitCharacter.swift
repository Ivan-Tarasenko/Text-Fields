//
//  LimitCharacter.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class LimitCharacter: UIViewController {

    @IBOutlet weak var customViewLimit: CustomView!
    @IBOutlet var mainView: UIView!

    let titleView = ScreenTitle()
    let localString = Localization()

    override func viewDidLoad() {
        super.viewDidLoad()
        customViewLimit.settingView(type: .inputLimit)
        createAccesibilityIdentifiersLimitVC()
        setTitle()
    }

    func setTitle() {
        titleView.title.textTitle = localString.titleLabelLimit
        mainView.addSubview(titleView.title)
        titleView.setTitle()
    }
}
