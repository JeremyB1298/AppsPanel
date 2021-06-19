//
//  SignUpViewController.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    private var signUpViewModel: SignUpViewModel!
    
    var activeTextField : UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupData()
    }
    
    @IBAction func actionSignUp(_ sender: UIButton) {
        if self.checkFieldsFilled() {
            self.sendSignUp()
        }
    }
}

private extension SignUpViewController {
    
    func setupData() {
        self.signUpViewModel = SignUpViewModel(signUpRepository: SignUpRepository(apiService: ApiService(), responseSignUpMapper: ResponseSignUpMapper()))
    }
    
    func setupUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.lastNameTextField.delegate = self
        self.emailTextField.delegate = self
        self.phoneTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if let activeTextField = activeTextField {
            
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            
            if bottomOfTextField > topOfKeyboard {
                self.view.frame.origin.y = 0 - (bottomOfTextField - topOfKeyboard)
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func sendSignUp() {
        if let lastName = lastNameTextField.text, let email = emailTextField.text, let phone = phoneTextField.text {
            self.signUpViewModel.sendSignUp(name: lastName, email: email, phone: phone, completion: { responseSignUp in
                DispatchQueue.main.async {
                    self.displayResultRequest(response: responseSignUp)
                }
            })
        }
    }
    
    func displayResultRequest(response: ResponseSignUp?) {
        if let response = response {
            let alert = UIAlertController(title: "", message: response.success.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: {
                switch response.success.code {
                case 200:
                    self.resetFields()
                    break
                default:
                    break
                }
            })
        }
        
    }
    
    func displayFieldsNotFilled() {
        let alert = UIAlertController(title: nil, message: "Vous devez remplir tous les champs correctement", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func resetFields() {
        self.lastNameTextField.text = nil
        self.emailTextField.text = nil
        self.phoneTextField.text = nil
    }
    
    func checkFieldsFilled() -> Bool {
        if let lastName = lastNameTextField.text, let email = emailTextField.text, let phone = phoneTextField.text {
            if !lastName.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !phone.trimmingCharacters(in: .whitespaces).isEmpty {
                if email.isValidEmail(), phone.isValidPhoneNumber() {
                    return true
                }
            }
        }
        displayFieldsNotFilled()
        return false
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = self.view?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}
