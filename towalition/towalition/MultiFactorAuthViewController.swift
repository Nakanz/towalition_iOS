//
//  MFAViewController.swift
//  towalition
//
//  Created by Nathan Hester on 3/10/21.
//

import UIKit

enum UserDefaultsKeys : String {
    case isLoggedIn
    case driverID
    case driverName
    case driverDistrict
    case driverEmail
    case driverPhone
    case driverLatitude
    case driverLongitude
}

extension UserDefaults{
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    //MARK: Save Driver Data
    func setDriverID(value: Int){
        set(value, forKey: UserDefaultsKeys.driverID.rawValue)
    }
    func setDriverLatitude(value: Double) {
        set(value, forKey: UserDefaultsKeys.driverLatitude.rawValue)
    }
    func setDriverLongitude(value: Double) {
        set(value, forKey: UserDefaultsKeys.driverLongitude.rawValue)
    }
    //MARK: Get Driver Data
    func getDriverID() -> Int {
        return integer(forKey: UserDefaultsKeys.driverID.rawValue)
    }
    func getDriverLatitude() -> Double {
        return double(forKey: UserDefaultsKeys.driverLatitude.rawValue)
    }
    func getDriverLongitude() -> Double {
        return double(forKey: UserDefaultsKeys.driverLongitude.rawValue)
    }
}

class MultiFactorAuthViewController: UIViewController {

    @IBOutlet weak var sixDigitCode: UITextField!
    var driver: Driver?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func check(_ code: String) -> Bool {
        let numCode = Int(code)
        if (driver?.sixDigitCode == numCode) {
            UserDefaults.standard.setLoggedIn(value: true)
            UserDefaults.standard.setDriverID(value: driver!.driverID)
            return true
        } else {
            alert()
            return false
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return check(sixDigitCode.text!)
    }
    
    private func alert() {
        let alert = UIAlertController(title: "Error", message: "Invalid 6-digit passcode, please try again.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        sixDigitCode.text = ""
    }
}
