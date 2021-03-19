//
//  ProfileViewController.swift
//  towalition
//
//  Created by Nathan Hester on 3/11/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var driverDistrict: UILabel!
    @IBOutlet weak var driverEmail: UILabel!
    @IBOutlet weak var driverPhone: UILabel!
    var name: String?
    var district: String?
    var email: String?
    var phone: String?
    var driver: Driver?
    
    @IBAction func backToGeo(_ sender: Any) {
        performSegue(withIdentifier: "unwindToGeoMap", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let dID = UserDefaults.standard.getDriverID()
        for i in 0..<driverDatabase.count {
            if (driverDatabase[i].driverID == dID) {
                driver = driverDatabase[i]
                break
            }
        }
        driverName.text = driver!.firstname + " " + driver!.lastname
        driverDistrict.text = driver!.district.rawValue
        driverEmail.text = driver!.email
        driverPhone.text = driver!.phoneNumber
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
