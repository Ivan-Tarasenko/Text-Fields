//
//  NoDigit.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class NoDigit: UIViewController {

    @IBOutlet weak var customViewNoDigit: CustomView!
    @IBOutlet var mainView: UIView!

    let titleView = TitleView()
    let localString = Localization()

    override func viewDidLoad() {
        super.viewDidLoad()
        customViewNoDigit.settingView(type: .noDigits)
        createAccesibilityIdentifiersNoDigitVC()
        setTitle()
    }

    func setTitle() {
        titleView.title.textTitle = localString.titleLabelNoDigit
        mainView.addSubview(titleView.title)
        titleView.setTitle()
    }
}
