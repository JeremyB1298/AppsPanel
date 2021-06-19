//
//  DetailResponseSignUp.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class DetailResponseSignUp {
    var message: String
    var key: String
    var code: Int
    
    init(message: String, key: String, code: Int) {
        self.message = message
        self.key = key
        self.code = code
    }
}
