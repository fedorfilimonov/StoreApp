//
//  ProfileViewController.swift
//  StoreApp
//
//  Created by Федор Филимонов on 31.03.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - Managers
    let requestFactory = RequestFactory()

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentProfileDetails()
        
    }
    
    func showCurrentProfileDetails() {
        getUserId()
        getUserName()
        
    }
    
    func getUserId() {
        let id = UserDefaults.standard.string(forKey: "userID") ?? "-"
        userIdLabel.text = "User ID: \(id)"
    }
    
    func getUserName() {
        let firstName = UserDefaults.standard.string(forKey: "userFirstName") ?? "-"
        let lastName = UserDefaults.standard.string(forKey: "userLastName") ?? "-"
        
        firstNameTextField.placeholder = firstName
        lastNameTextField.placeholder = lastName
    }
    
    @IBAction func updateProfile(_ sender: Any) {
        let updateProfile = requestFactory.makeUpdateProfileRequestFactory()
        updateProfile.updateProfile(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let updateProfile):
                    print(updateProfile)
                    
                    if updateProfile.result == 1 {
                        self.updateSuccessNotification()
                    }
                    else {
                        self.updateFailureNotification()
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    self.updateFailureNotification()
                }
            }
        }
    }
    
    func updateSuccessNotification() {
        let alertController = UIAlertController(title: NSLocalizedString("Done", comment: ""),
                                                message: NSLocalizedString("Changes saved", comment: ""),
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func updateFailureNotification() {
        let alertController = UIAlertController(title: NSLocalizedString("Failed", comment: ""),
                                                message: NSLocalizedString("Please try again", comment: ""),
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}
