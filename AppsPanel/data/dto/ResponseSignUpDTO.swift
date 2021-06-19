//
//  ResponseSignUpDTO.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class ResponseSignUpDTO: Codable {
    var success: DetailResponseSignUpDTO
    
    enum CodingKeys: String, CodingKey {
        case success
    }
}
