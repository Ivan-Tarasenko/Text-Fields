//
//  LinkVC.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 12.12.2021.
//

import Foundation

extension Link {

    func createAccesibilityIdentifierslinkVC () {
        titleView.title.accessibilityIdentifier = "TextField_Title"
        customViewLink.accessibilityIdentifier = "Link_View"
        customViewLink.title.accessibilityIdentifier = "Link_Title"
        customViewLink.textField.accessibilityIdentifier = "Link_TextField"
    }
}
