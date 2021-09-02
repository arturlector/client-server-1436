//
//  LoginViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 02.09.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let authService = Auth.auth()
    
    private var token: AuthStateDidChangeListenerHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = authService.addStateDidChangeListener({ [weak self] auth, user in
            
            guard user != nil else { return }
            self?.showHomeVC()
        })

    }
    
    //MARK: - Private
    
    private func showHomeVC() {
        guard let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") else { return }
        guard let window = self.view.window else { return }
        window.rootViewController = vc
    }
    
    private func showAlert(title: String?, text: String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let okControl = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okControl)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Actions
    @IBAction func signInAction(_ sender: Any?) {
        
        guard let email = loginTextField.text, loginTextField.hasText,
              let password = passwordTextField.text, passwordTextField.hasText
        else {
            showAlert(title: "Ошибка введенных данных", text: "Логин или пароль не введены")
            return
        }
        
        authService.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                self?.showAlert(title: "Ошибка Firebase Авторизации", text: error.localizedDescription)
                return
            }
            
            self?.showHomeVC()
        }
        
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        guard let email = loginTextField.text, loginTextField.hasText,
              let password = passwordTextField.text, passwordTextField.hasText
        else {
            showAlert(title: "Ошибка введенных данных", text: "Логин или пароль не введены")
            return
        }
        
        authService.createUser(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                self?.showAlert(title: "Ошибка Firebase Авторизации", text: error.localizedDescription)
                return
            }
            
            self?.signInAction(nil)
        }
        
    }
    
}
