//
//  String+Extension.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPhoneNumber() -> Bool {
            let regEx = "[0-9]{10,10}"

            let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
            return phoneCheck.evaluate(with: self)
        }
}
