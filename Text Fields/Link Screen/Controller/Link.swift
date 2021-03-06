//
//  Link.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class Link: UIViewController {

    @IBOutlet weak var customViewLink: CustomView!
    @IBOutlet var mainView: UIView!

    let titleView = ScreenTitle()
    let localString = Localization()

    override func viewDidLoad() {
        super.viewDidLoad()
        customViewLink.settingView(type: .link)
        createAccesibilityIdentifierslinkVC()
        setTitle()
    }

    func setTitle() {
        titleView.title.textTitle = localString.titleLabelLink
        mainView.addSubview(titleView.title)
        titleView.setTitle()
    }
}
