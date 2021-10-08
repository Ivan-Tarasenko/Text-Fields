//
//  TextField.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 24.09.2021.
//

import UIKit

extension UITextField {

    var string: String {
        get {
            return text ?? ""
        }
        set {
            text = newValue
        }
    }

    func cornerRadius(value: CGFloat, color: UIColor) {
        self.layer.cornerRadius = value
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
        self.layer.masksToBounds = true
    }
}
