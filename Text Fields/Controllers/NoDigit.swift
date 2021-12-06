//
//  NoDigit.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class NoDigit: UIViewController {

    @IBOutlet weak var customViewNoDigit: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()

        customViewNoDigit.settingView(type: .noDigits)

    }
}
