//
//  ViewController.swift
//  towalition
//
//  Created by Nathan Hester on 3/10/21.
//

import UIKit


class LoginViewController: UIViewController {

    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var verifyButton: UIButton!
    var driver: Driver?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // let preferences = UserDefaults.standard
        
    }
    
    // username: kkino password: kapahuludriver
    private func check(_ username: String, _ password: String) -> Bool {
        for i in 0..<driverDatabase.count {
            if (driverDatabase[i].username == username && driverDatabase[i].password == password) {
                driver = driverDatabase[i]
                return true
            }
        }
        let alert = UIAlertController(title: "Error", message: "Invalid username or password, please try again.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        usernameTextField.text = ""
        passwordTextField.text = ""
        
        return false
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        // quick type check
        if (username == nil
                || password == nil)     { return false }
        if (username == ""
                || password == "")      { return false }
        if (username!.count < 3
                || password!.count < 3) { return false }
        
        // credentials do not match any driver accounts, return
        if (!check(username!, password!)) { return false }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let multiFactorAuthViewController = segue.destination as? MultiFactorAuthViewController {
            multiFactorAuthViewController.driver = self.driver
        }
    }
}

