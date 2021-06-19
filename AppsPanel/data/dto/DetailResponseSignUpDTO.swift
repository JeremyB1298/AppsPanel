//
//  DetailResponseSignUpDTO.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class DetailResponseSignUpDTO: Codable {
    var message: String
    var key: String
    var code: Int
    
    enum CodingKeys: String, CodingKey {
        case message
        case key
        case code
    }
}
