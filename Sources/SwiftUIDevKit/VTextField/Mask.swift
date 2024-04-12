//
//  Mask.swift
//
//
//  Created by VISHNU on 4/12/24.
//

import Foundation

// MARK: - Mask text into any format
func maskInput(mask: String, input: String) -> String {
    let cleanInput = input.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    var result = ""
    var index = cleanInput.startIndex
    for ch in mask where index < cleanInput.endIndex {
        if ch == "X" {
            result.append(cleanInput[index])
            index = cleanInput.index(after: index)
        } else {
            result.append(ch)
        }
    }
    return result
}
