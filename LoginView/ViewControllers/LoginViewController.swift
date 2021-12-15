//
//  ViewController.swift
//  LoginView
//
//  Created by Snow Lukin on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        setTextFields()
        // not really needed but just for practicing
        getKeyboardStatus()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.setGradient()
    }
    
    // MARK: - Override methods
    
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
        isUserExist()
    }
    
    // MARK: - IBActions
    
    @objc func keyboardWillBeShown(_ notification: NSNotification) {
        
        // move view when keyboard shows up
        let heigthChange = CGFloat(10)
        self.view.frame.origin.y = 0 - heigthChange
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
        
        // move view back to normal
        self.view.frame.origin.y = 0
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
        let loginVC = unwindSegue.destination as! LoginViewController
        loginVC.userNameTF.text = nil
        loginVC.passwordTF.text = nil
    }

    @IBAction func forgotUserNameAction(_ sender: UIButton) {
        forgotAlert(title: "Forgot UserName?", message: "Your UserName is Eugenya")
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        forgotAlert(title: "Forgot Password?", message: "Your Password is SwiftBook")
    }
    
    // MARK: - Public Methods
    
    func isUserExist() -> Bool {
        guard let userName = userNameTF.text, let password = passwordTF.text,
                checkUser(userName: userName, password: password)
        else {
            invalidInputAlert(title: "Error", message: "Invalid UserName or Password")
            return false
        }
        return true
    }
    
    // MARK: - Private Methods
    
    private func setTextFields() {
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        
        passwordTF.enablesReturnKeyAutomatically = true
    }
    
    // MARK: Alerts
    
    private func forgotAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func invalidInputAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTF.text = nil
            self.passwordTF.text = nil
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // MARK: Keyboard
    private func getKeyboardStatus() {
        
        // Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeShown(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Check User
    private func checkUser(userName: String, password: String) -> Bool {
        users.contains(where: {
            $0.userName == userName && $0.password == password
        })
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    // MARK: TextField Extension
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case userNameTF:
            passwordTF.becomeFirstResponder()
        case passwordTF:
            passwordTF.resignFirstResponder()
            // if username and password filled perform segue
            if isUserExist() {
                performSegue(withIdentifier: "LogInSegue", sender: self)
            }
        default:
            break
        }
        
        return true
    }
}

