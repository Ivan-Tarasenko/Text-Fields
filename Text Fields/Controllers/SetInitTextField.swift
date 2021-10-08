//
//  SetInitTextField.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 24.09.2021.
//

import UIKit

class SetInitialTextField: UITextField {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setBorderColor()
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.setBorderColor()
    }
    func setBorderColor() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.systemGray6.cgColor
        self.layer.masksToBounds = true
    }
}
