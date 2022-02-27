//
//  LoginViewController.swift
//  alkemy-project
//
//  Created by Mariano Battaglia on 21/02/2022.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        self.roundCorners()
    }
    
    @IBAction func logInButtonTapped(_ sender: Any) {
        if let userName = emailTextField.text, !userName.isEmpty {
            validEmail(userName) ? self.presentTabBarController() : self.presentAlertView()
        } else {
            self.presentAlertView()
        }
    }
    
    func roundCorners(){
        //logInButton.layer.cornerRadius = 10
        //logInButton.layer.borderWidth = 1
    }
    func presentTabBarController(){
        self.navigationController?.pushViewController(TabBarViewController(), animated: true)
    }
    func presentAlertView(){
        let alert = UIAlertController(title: "Alerta", message: "El email ingresado es invalido", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func validEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
