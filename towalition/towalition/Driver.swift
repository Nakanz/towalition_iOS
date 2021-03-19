//
//  Driver.swift
//  towalition
//
//  Created by Nathan Hester on 3/12/21.
//

import Foundation
import MapKit

class Driver {
    let driverID: Int
    let dispatcherID: Int
    let firstname: String
    let lastname: String
    let phoneNumber: String
    let email: String
    let username: String
    let password: String
    let sixDigitCode: Int
    let district: District
    let latitude: Double
    let longitude: Double

    // utility initializer
    init () {
        self.driverID = 0
        self.dispatcherID = 0
        self.firstname = ""
        self.lastname = ""
        self.phoneNumber = ""
        self.email = ""
        self.username = ""
        self.password = ""
        self.sixDigitCode = 0
        self.district = District.kapahulu
        self.latitude = 0
        self.longitude = 0
    }
    
    init (driverID: Int, dispatcherID: Int, firstname: String, lastname: String, phoneNumber: String, email: String, username: String, password: String, sixDigitCode: Int, district: District, latitude: Double, longitude: Double) {
        self.driverID = driverID
        self.dispatcherID = dispatcherID
        self.firstname = firstname
        self.lastname = lastname
        self.phoneNumber = phoneNumber
        self.email = email
        self.username = username
        self.password = password
        self.sixDigitCode = sixDigitCode
        self.district = district
        self.latitude = latitude
        self.longitude = longitude
    }
}
// password and sixDigitCode are "driver" and "000000" respectively are for testing reasons only
let driverDatabase = [
    // kapahulu district driver
    Driver(driverID: 0001, dispatcherID: 1000, firstname: "Kaumaha", lastname: "Kino", phoneNumber: "(808)-732-7322", email: "kaumahakinohooks@gmail.com", username: "kkino", password: "driver", sixDigitCode: 000000,  district: District.kapahulu, latitude: 21.276350, longitude: -157.814895),
    
    // kaimuki district driver
    Driver(driverID: 0002, dispatcherID: 2000, firstname: "Aukaika", lastname: "Welinamai", phoneNumber: "(808)-444-7322", email: "aukaikawelinamaihooks@gmail.com", username: "awelinamai", password: "driver", sixDigitCode: 000000, district: District.kaimuki, latitude: 21.278092, longitude: -157.801302),
    
    // ala moana district driver
    Driver(driverID: 0003, dispatcherID: 3000, firstname: "Lama", lastname: "Kamanawa", phoneNumber: "(808)-486-6322", email: "lamakamanawahooks@gmail.com", username: "lkamanawa", password: "driver", sixDigitCode: 000000, district: District.alamoana, latitude: 21.287822, longitude: -157.843824),
    
    // kahala district driver
    Driver(driverID: 0004, dispatcherID: 4000, firstname: "Waha", lastname: "Okayama", phoneNumber: "(808)-464-7624", email: "wahaokayamahooks@gmail.com", username: "wokayama", password: "driver", sixDigitCode: 000000, district: District.kahala, latitude: 21.272475, longitude: -157.782891),
    
    // hawaii kai district driver
    Driver(driverID: 0005, dispatcherID: 5000, firstname: "Kainalu", lastname: "Akau", phoneNumber: "(808)-944-7392", email: "kainaluakauhooks@gmail.com", username: "kakau", password: "driver", sixDigitCode: 000000, district: District.hawaiikai, latitude: 21.289265, longitude: -157.714792),
    
    // iwalei district driver
    Driver(driverID: 0006, dispatcherID: 6000, firstname: "Nainoa", lastname: "Nohoana", phoneNumber: "(808)-445-4547", email: "nainoanohoanahooks@gmail.com", username: "nnohoana", password: "driver", sixDigitCode: 000000, district: District.iwilei, latitude: 21.322300, longitude: -157.880108),
    
    // kaka'ako district driver
    Driver(driverID: 0007, dispatcherID: 7000, firstname: "Max", lastname: "Hollaway", phoneNumber: "(808)-274-7322", email: "maxhollawayrighthooks@blessed.com", username: "mhollaway", password: "driver", sixDigitCode: 000000, district: District.kakaako, latitude: 21.303717, longitude: -157.855390),
]

func getDriverById(id: Int) -> Driver {
    var driver = Driver()
    for i in 0..<driverDatabase.count {
        if (driverDatabase[i].driverID == id) {
            driver = driverDatabase[i]
        }
    }
    return driver
}
