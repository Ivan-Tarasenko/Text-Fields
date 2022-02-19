//
//  String+StringComparison.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 24.11.2021.
//

import Foundation

extension String {
    
    static func ~= (lhs: String, rhs: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
        let range = NSRange(location: 0, length: lhs.utf16.count)
        return regex.firstMatch(in: lhs, options: [], range: range) != nil
    }
}
