//
//  LimitCharacter.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class LimitCharacter: UIViewController {

    @IBOutlet weak var customViewLimit: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()

        customViewLimit.settingView(type: .inputLimit)
    }
}
