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

    let titleView = TitleView()
    let localString = Localization()

    override func viewDidLoad() {
        super.viewDidLoad()
        customViewLink.settingView(type: .link)
        setTitle()
    }

    func setTitle() {
        titleView.title.textTitle = localString.titleLabelLink
        createAccesibilityIdentifierslinkVC()
        mainView.addSubview(titleView.title)
        titleView.setTitle()
    }
}
