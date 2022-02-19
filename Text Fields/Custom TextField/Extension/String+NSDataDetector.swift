//
//  String+NSDataDetector.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 03.11.2021.
//

import Foundation

extension String {
    
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        }
        return false
    }
}
