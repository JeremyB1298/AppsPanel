//
//  ResponseSignUpMapper.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class ResponseSignUpMapper {
    
    func responseMap(response: DetailResponseSignUpDTO) -> DetailResponseSignUp {
        return DetailResponseSignUp(message: response.message, key: response.key, code: response.code)
    }
    
    func responseMap(response: ResponseSignUpDTO) -> ResponseSignUp {
        return ResponseSignUp(success: self.responseMap(response: response.success))
    }
}
