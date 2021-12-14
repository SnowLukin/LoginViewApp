//
//  ViewController.swift
//  LoginView
//
//  Created by Snow Lukin on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
    
    // Hide keyboard by touching on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = userNameTF.text
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let userName = userNameTF.text, !userName.isEmpty,
                let password = passwordTF.text, !password.isEmpty
        else {
            invalidInputAlert(title: "Error", message: "Invalid UserName or Password")
            return false
        }
        return true
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        let loginVC = unwindSegue.destination as! LoginViewController
        loginVC.userNameTF.text = ""
        loginVC.passwordTF.text = ""
    }

    @IBAction func forgotUserNameAction(_ sender: UIButton) {
        forgotAlert(title: "Forgot UserName?", message: "Your UserName is Eugenya")
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        forgotAlert(title: "Forgot Password?", message: "Your Password is SwiftBook")
    }
    
}

extension LoginViewController {
    private func forgotAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func invalidInputAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTF.text = ""
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
