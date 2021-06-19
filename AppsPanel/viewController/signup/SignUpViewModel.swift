//
//  SignUpViewModel.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

class SignUpViewModel {
    
    private var signUpRepository: SignUpRepository
    
    init(signUpRepository: SignUpRepository) {
        self.signUpRepository = signUpRepository
    }
    
    func sendSignUp(name: String, email: String, phone: String, completion: @escaping ((ResponseSignUp?) -> Void)) {
        self.signUpRepository.sendSignUp(signUpDTO: SignUpDTO(name: name, email: email, phone: phone), completion: completion)
    }
    
}
