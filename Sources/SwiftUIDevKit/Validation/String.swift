//
//  Extension+String.swift
//  My Form
//
//  Created by Vishnu Priyan on 2/12/24.
//

import Foundation

// MARK: - String Validation 
extension String {
    ///check empty
    public func isEmptyString() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    ///email
    public func isValidEmailAddress() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: self)
    }
    ///password
    public func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@@$!%*?&<>-^*?_()+#])[A-Za-z\\d@@$!%*?&<>-^*?_()+#]{8,12}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return predicate.evaluate(with: self)
    }
    ///phone
    public func isValidPhone_US() -> Bool {
        let phoneRegex = #"^(\([1-9]{3}\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return predicate.evaluate(with: self)
    }
    ///zip code
    public func isValidZipcode_US() -> Bool {
        let zipCodeRegex = "^[0-9]{5}(-[0-9]{4})?$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", zipCodeRegex)
        return predicate.evaluate(with: self)
    }
}
