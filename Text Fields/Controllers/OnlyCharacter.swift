//
//  OnlyCharacter.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class OnlyCharacter: UIViewController {
    
    @IBOutlet weak var customViewOnlyChar: CustomView!
    @IBOutlet var mainView: UIView!

    let titleView = TitleView()
    let localString = Localization()

    override func viewDidLoad() {
        super.viewDidLoad()
        customViewOnlyChar.settingView(type: .onlyCharacters)
        setTitle()
    }

    func setTitle() {
        titleView.title.textTitle = localString.titleLabelOnlyChar
        mainView.addSubview(titleView.title)
        titleView.setTitle()
    }
}
