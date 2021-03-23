//
//  LoginViewController.swift
//  StoreApp
//
//  Created by Федор Филимонов on 18.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK:- UI
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var continueAsGuestButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    // Managers
    let requestFactory = RequestFactory()
    
    // MARK: - Instance Properties
    
    // Segue name
    static let storyboardIdentifier: String = "LoginPageSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientButtons()
    }
    
    func makeGradientButtons() {
        self.loginButton.applyGradient(colors: [ButtonGradient.UIColorFromRGB(0x2B95CE).cgColor,ButtonGradient.UIColorFromRGB(0x2ECAD5).cgColor])
        
        self.continueAsGuestButton.applyGradient(colors: [ButtonGradient.UIColorFromRGB(0xBDC3C7).cgColor,ButtonGradient.UIColorFromRGB(0x2C3E50).cgColor])
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard emailTextField.text != nil || passwordTextField.text != nil else { return }
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        print(email)
        print(password)
        
        loginRequest(userName: email, password: password)
        
    }
    
    func loginRequest(userName: String, password: String) {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: userName, password: password) { [self] response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let login):
                    print(login)
                    
                    if login.result == 1 {
                        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                        print("Login succesfull")
                        dismiss(animated: true, completion: nil)
                    }
                    else {
                        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
                        print("Login failed")
                        failureAllert()
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    failureAllert()
                }
            }
        }
    }
    
    func failureAllert() {
        let alertController = UIAlertController(title: NSLocalizedString("Failed", comment: ""),
                                                message: NSLocalizedString("Please try again", comment: ""),
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func guestButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        print("Continued as guest")
        dismiss(animated: true, completion: nil)
    }
    
}
