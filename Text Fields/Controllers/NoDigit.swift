//
//  NoDigit.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class NoDigit: UIViewController {

    @IBOutlet weak var customViewNoDigit: CustomView!

    let colorView = UIColor(red: 255/255, green: 152/255, blue: 93/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        customViewNoDigit.settingView(type: .noDigits)

    }
}
