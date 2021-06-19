//
//  SignUpRepository.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import Foundation

class SignUpRepository {
    
    private var apiService: ApiService
    private var responseSignUpMapper: ResponseSignUpMapper
    
    init(apiService: ApiService, responseSignUpMapper: ResponseSignUpMapper) {
        self.apiService = apiService
        self.responseSignUpMapper = responseSignUpMapper
    }
    
    func sendSignUp(signUpDTO: SignUpDTO, completion: @escaping ((ResponseSignUp?) -> Void)) {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(signUpDTO)
            self.apiService.request(fromURLString: ApiValues.SIGNUP_URL, headers: ["X-AP-Key":"uD4Muli8nO6nzkSlsNM3d1Pm", "X-AP-DeviceUID":"trial", "Accept":"application/json", "Content-Type":"multipart/form-data"], completion: { result in
                switch result {
                case .success(let data):
                    if let response = self.apiService.parse(T: ResponseSignUpDTO.self, jsonData: data) {
                        completion(self.responseSignUpMapper.responseMap(response: response))
                    } else {
                        completion(nil)
                    }
                    
                case .failure(let error):
                    completion(nil)
                    print(error)
                }
            }, httpMethod: "POST", parameters: data)
        } catch let error {
            print(error)
        }
    }
    
}
