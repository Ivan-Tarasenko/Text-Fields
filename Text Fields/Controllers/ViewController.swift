//
//  ViewController.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 18.09.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var noDigitsView: CustomView!
    @IBOutlet weak var inputLimitView: CustomView!
    @IBOutlet weak var onlyCharactersView: CustomView!
    @IBOutlet weak var linkView: CustomView!
    @IBOutlet weak var validationRulesView: CustomView!

    @IBOutlet weak var bottonChangeLanguege: UIButton!
    @IBOutlet weak var languege: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsView.settingView(type: .noDigits)
        inputLimitView.settingView(type: .inputLimit)
        onlyCharactersView.settingView(type: .onlyCharacters)
        linkView.settingView(type: .link)
        validationRulesView.settingView(type: .validationRules)
    }

    @IBAction func pressChangeLanguege(_ sender: UIButton) {
        sender.tintColor = .red
    }

}
