//
//  LoginViewController.swift
//  LoginView
//
//  Created by Snow Lukin on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        setTextFields()
        // move view when keyboard change frame
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
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let user = findUser(userName: userNameTF.text ?? "", password: passwordTF.text ?? "")
        guard let user = user else { return }
        
        let tabBarController = segue.destination as! UITabBarController
        // needs to be unwraped forcefully
        let viewControllers = tabBarController.viewControllers!
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = user.name
            }
            if let infoNavVC = viewController as? InfoNavigationViewController {
                let infoVC = infoNavVC.topViewController as! InfoViewController
                infoVC.nameString = user.name
                infoVC.bioString = user.bio
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        isUserExist()
    }
    
    // MARK: - IBActions
    
    @objc func keyboardWillBeShown(_ notification: NSNotification) {
        
        // move view when keyboard shows up
        let heigthChange: CGFloat = 100
        view.frame.origin.y = 0 - heigthChange
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
        
        // move view back to normal
        view.frame.origin.y = 0
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        forgotAlert(title: "Forgot password?\n", message: "Your password is Swiftbook\n")
    }
    
    @IBAction func continueAsClicked(_ sender: UIButton) {
        userNameTF.text = "Snow"
        passwordTF.text = "Lukin"
        performSegue(withIdentifier: "LogInSegue", sender: self)
    }
    
    // MARK: - Public Methods
    
    func isUserExist() -> Bool {
        guard let userName = userNameTF.text, let password = passwordTF.text,
                checkUser(userName: userName, password: password)
        else {
            let title = "Incorrect username or password\n"
            let message = "The username or password you entered is incorrect. Please try again.\n"
            invalidInputAlert(title: title, message: message)
            return false
        }
        return true
    }
    
    // MARK: - Private Methods
    
    private func setTextFields() {
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        
        passwordTF.enablesReturnKeyAutomatically = true
        
        userNameTF.tintColor = .lightGray
        userNameTF.setIcon(UIImage(named: "user")!)
        
        passwordTF.tintColor = .lightGray
        passwordTF.setIcon(UIImage(named: "password")!)
    }
    
    // MARK: Keyboard
    private func getKeyboardStatus() {
        
        // Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeShown(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Find user
    private func findUser(userName: String, password: String) -> User? {
        for user in users {
            if user.userName == userName && user.password == password {
                return user
            }
        }
        return nil
    }
    
    // MARK: Check User
    private func checkUser(userName: String, password: String) -> Bool {
        users.contains(where: {
            $0.userName == userName && $0.password == password
        })
        
        
    }
}


// MARK: TextField
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if isUserExist() {
            performSegue(withIdentifier: "LogInSegue", sender: self)
        }
        
        return true
    }
}

// MARK: Alerts
extension LoginViewController {
    private func forgotAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.setNeededFont()
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func invalidInputAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = nil
        }
        
        alert.setNeededFont()
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
