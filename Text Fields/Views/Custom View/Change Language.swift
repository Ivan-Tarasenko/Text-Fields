//
//  Change Language.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 27.11.2021.
//

import UIKit
import SnapKit

class ChangeLanguage {
    
    lazy var changeButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle(R.string.localizable.change_languange(), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    lazy var changeLabel: UILabel = {
        let label = UILabel()
        label.textTitle = R.string.localizable.label_Change()
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.3
        label.font = R.font.sfProDisplayRegular(size: 21)
        return label
    }()

    @objc func buttonAction(sender: UIButton!) {

        print("Button tapped")
    }
}
