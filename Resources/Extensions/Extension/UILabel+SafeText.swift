//
// UILabel+SafeText.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 16.10.2021.
//

import UIKit

extension UILabel {

    var textTitle: String {
        get {
            return text ?? ""
        }
        set {
            text = newValue
        }
    }
}
