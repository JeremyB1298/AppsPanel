//
//  ViewController+Extension.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import UIKit

extension UIViewController {
    func displayErrorAlert() {
        let alert = UIAlertController(title: nil, message: "Un problème est survenue, veuillez vérifier votre connexion ou relancer l'application", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
