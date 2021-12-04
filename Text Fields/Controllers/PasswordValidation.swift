//
//  PasswordValidation.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class PasswordValidation: UIViewController {

    @IBOutlet weak var customViewPassValid: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()

        customViewPassValid.settingView(type: .validationRules)
    }
}
