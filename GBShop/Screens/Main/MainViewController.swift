//
//  MainViewController.swift
//  StoreApp
//
//  Created by Федор Филимонов on 19.03.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI
    
    
    // MARK: - Instance Properties
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start app with user not logged in
        defaults.set(false, forKey: "isUserLoggedIn")
        
        checkIfUserIsLoggedIn()
    }
    
    func checkIfUserIsLoggedIn() {
        let isUserLoggedIn = defaults.bool(forKey: "isUserLoggedIn")
        
        guard isUserLoggedIn else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.performSegue(withIdentifier: LoginViewController.storyboardIdentifier, sender: nil)
            })
            return
        }
    }
}
