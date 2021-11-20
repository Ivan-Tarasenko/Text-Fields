//
//  LimitCharacters.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 25.10.2021.
//

import UIKit

class Limit {
    
var limit = 10
    
func getLimit (string: String, limit: Int) -> String {
    var countLimit = String()

    switch string.count {
    case nil:
        countLimit = "0/\(limit)"
    case 0...limit:
        countLimit = "\(string.count)/\(limit)"
    case limit...string.count:
        countLimit = "\(limit - string.count)/\(limit)"
    default:
        break
    }
    return countLimit
}
}
