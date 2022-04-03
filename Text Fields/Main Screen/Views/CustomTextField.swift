//
//  CustomTextField.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 16.03.2022.
//

import UIKit

class CustomTextField: UITextField {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setDefaultBorder()
    }
    
    func setDefaultBorder() {
        layer.cornerRadius = 10
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.masksToBounds = true
    }

 func setBorder(radius: CGFloat, color: UIColor) {
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
}
