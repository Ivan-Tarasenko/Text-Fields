//
//  Change Language.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 27.11.2021.
//

import UIKit

class ChangeLanguage {

    let test = "ru"

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

    @objc func buttonAction(sender: UIButton!) {

        //        var testVar: String {
        //            switch sender.tag {
        //            case 1:
        //                return "ru"
        //            case 2:
        //                return "en"
        //            case 3:
        //                return "es"
        //            case 4:
        //                return "uk"
        //            default:
        //                return "zh"
        //            }
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
                            return "zh-HK"
                        }
                    }
                print(switchLanguage())
        //        print(testVar)
    }
}
