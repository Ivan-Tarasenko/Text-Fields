//
//  OnlyCharacter.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class OnlyCharacter: UIViewController {

    @IBOutlet weak var customViewOnlyChar: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()

        customViewOnlyChar.settingView(type: .onlyCharacters)
    }
}
