//
//  UITextField+Border.swift
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

    func setBorder(radius: CGFloat, color: UIColor) {
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
}
