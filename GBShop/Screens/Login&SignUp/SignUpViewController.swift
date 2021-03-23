//
//  SignUpViewController.swift
//  StoreApp
//
//  Created by Федор Филимонов on 19.03.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var signUpButton: UIButton!
    
    // Managers
    let requestFactory = RequestFactory()
    
    // MARK: - Instance Properties
    
    // Segue name
    static let storyboardIdentifier: String = "SignUpPageSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientButtons()
    }
    
    func makeGradientButtons() {
        self.signUpButton.applyGradient(colors: [ButtonGradient.UIColorFromRGB(0x2B95CE).cgColor,ButtonGradient.UIColorFromRGB(0x2ECAD5).cgColor])
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let signUp = requestFactory.makeSignUpRequestFactory()
        signUp.signUp(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let register):
                    print(register)
                    
                    if register.result == 1 {
                        print("Sign Up succesfull")
                        self.dismiss(animated: true, completion: nil)
                    }
                    else {
                        print("Sign Up  failed")
                        self.failureAllert()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    self.failureAllert()
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
    
}
