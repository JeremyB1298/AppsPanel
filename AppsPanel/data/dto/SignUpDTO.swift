//
//  SignUpDTO.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class SignUpDTO: Codable {
    
    var name: String
    var email: String
    var phone: String
    var picture: String?
    
    init(name: String, email: String, phone: String) {
        self.name = name
        self.email = email
        self.phone = phone
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case phone
        case picture
    }
}
