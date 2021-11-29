//
//  Change Language.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 27.11.2021.
//

import UIKit

enum BandlLang {
    case rus
    case end
    case span
    case ukr
    case chin
}

class ChangeLanguage {

    let switchLanguage: BandlLang = .rus

    lazy var russianButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("RU", for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    lazy var englishButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("EN", for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    lazy var spanishButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("ES", for: .normal)
        button.tag = 3
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    lazy var ukrainianButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("UK", for: .normal)
        button.tag = 4
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    lazy var chineseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("CN", for: .normal)
        button.tag = 5
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    @objc func buttonAction(sender: UIButton!) -> String {
//
//        switch switchLanguage {
//        case .rus:
//            <#code#>
//        case .end:
//            <#code#>
//        case .span:
//            <#code#>
//        case .uk:
//            <#code#>
//        case .chin:
//            <#code#>
//        }

        func switchLanguage() -> String {
            switch sender.tag {
            case 1:
                return "ru"
            case 2:
                return "en"
            case 3:
                return "es"
            case 4:
                return "uk"
            default:
                return "zh"
            }
        }
        return switchLanguage()
    }
}
