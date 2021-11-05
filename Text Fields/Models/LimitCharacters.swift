//
//  LimitCharacters.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 25.10.2021.
//

import UIKit

class Limit {
    
    func limitCharacter(textField: UITextField, label: UILabel) {
        let countCharacter = textField.string.count
        if countCharacter <= 10 {
            label.textTitle = "\(countCharacter)/10"
            textField.setBorder(radius: 10, color: UIColor.systemBlue)
        } else {
            label.textTitle = "\(10 - countCharacter)/10"
            textField.setBorder(radius: 10, color: UIColor.systemRed)
        }
    }
}
