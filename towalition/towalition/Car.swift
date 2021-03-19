//
//  Car.swift
//  towalition
//
//  Created by Nathan Hester on 3/11/21.
//

import Foundation
import MapKit

enum District: String {
    case kapahulu = "Kapahulu"
    case kahala = "Kahala"
    case kaimuki = "Kaimuki"
    case alamoana = "Ala Moana"
    case kakaako = "Kaka'ako"
    case iwilei = "Iwilei"
    case hawaiikai = "Hawaii Kai"
}

    var carsTemp = [
    Car(make: .toyota, model: "Corolla", year: 2012, color: .red, licensePlate: "NVS 181", district: .alamoana, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.294205, longitude: -157.848030)),
    Car(make: .toyota, model: "Camry", year: 2019, color: .blue, licensePlate: "WTF 345", district: .kahala, reason: .stalledVehical, location: CLLocationCoordinate2D(latitude: 21.273969, longitude: -157.788767)),
    Car(make: .toyota, model: "Prius", year: 2005, color: .black, licensePlate: "SUPDAWG", district: .kapahulu, reason: .abandonedVechical, location: CLLocationCoordinate2D(latitude: 21.284679, longitude: -157.813618)),
    Car(make: .toyota, model: "Tacoma", year: 1999, color: .orange, licensePlate: "HAYNKLA", district: .alamoana, reason: .accident, location: CLLocationCoordinate2D(latitude: 21.289953, longitude: -157.844670)),
    Car(make: .toyota, model: "Tacoma", year: 1990, color: .red, licensePlate: "NGG 215", district: .iwilei, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.319583, longitude: -157.868921)),
    Car(make: .toyota, model: "Tacoma", year: 1994, color: .green, licensePlate: "NJV 184", district: .kaimuki, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.280316, longitude: -157.804661)),
    Car(make: .toyota, model: "Tacoma", year: 1998, color: .black, licensePlate: "GJT 778", district: .kapahulu, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.282913, longitude: -157.816792)),
    Car(make: .toyota, model: "Tacoma", year: 2000, color: .gray, licensePlate: "WRS 720", district: .alamoana, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.292985, longitude: -157.844729)),
    Car(make: .toyota, model: "Tundra", year: 2004, color: .yellow, licensePlate: "TOOSLOW", district: .kahala, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.271787, longitude: -157.775887)),
    Car(make: .toyota, model: "Supra", year: 2002, color: .white, licensePlate: "FTG 584", district: .hawaiikai, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.293236, longitude: -157.704527)),
    Car(make: .toyota, model: "86", year: 2020, color: .green, licensePlate: "WED 322", district: .kakaako, reason: .stalledVehical, location: CLLocationCoordinate2D(latitude: 21.295985, longitude: -157.859938)),
    Car(make: .toyota, model: "Avalon", year: 2019, color: .green, licensePlate: "RTG 783", district: .kapahulu, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.283448, longitude: -157.813007)),
    Car(make: .toyota, model: "Yaris", year: 2013, color: .white, licensePlate: "RSV 854", district: .iwilei, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.318633, longitude: -157.872795)),
    Car(make: .toyota, model: "Highlander", year: 2020, color: .brown, licensePlate: "FHH 567", district: .kaimuki, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.282109, longitude: -157.802169)),
    Car(make: .toyota, model: "4Runner", year: 1996, color: .blue, licensePlate: "XCF 986", district: .kakaako, reason: .accident, location: CLLocationCoordinate2D(latitude: 21.297049, longitude: -157.857464)),
    Car(make: .toyota, model: "Sienna", year: 2007, color: .black, licensePlate: "OKI 187", district: .hawaiikai, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.280672, longitude: -157.701447)),
    Car(make: .nissan, model: "Altima", year: 2012, color: .red, licensePlate: "ESS 434", district: .hawaiikai, reason: .abandonedVechical, location: CLLocationCoordinate2D(latitude: 21.286223, longitude: -157.706881)),
    Car(make: .nissan, model: "GT-R", year: 2019, color: .blue, licensePlate: "GAJ 947", district: .kapahulu, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.281221, longitude: -157.813072)),
    Car(make: .nissan, model: "Pathfinder", year: 2005, color: .black, licensePlate: "NSW 217", district: .iwilei, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.315623, longitude: -157.866009)),
    Car(make: .nissan, model: "Frontier", year: 1999, color: .orange, licensePlate: "YDX 720", district: .kaimuki, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.278046, longitude: -157.805829)),
    Car(make: .nissan, model: "Sentra", year: 2004, color: .yellow, licensePlate: "XNR 275", district: .kakaako, reason: .abandonedVechical, location: CLLocationCoordinate2D(latitude: 21.296527, longitude: -157.864475)),
    Car(make: .nissan, model: "Skyline", year: 2002, color: .white, licensePlate: "ECP 606", district: .alamoana, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.294699, longitude: -157.846198)),
    Car(make: .nissan, model: "Fuga", year: 2020, color: .brown, licensePlate: "TPT 753", district: .kaimuki, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.284232, longitude: -157.806889)),
    Car(make: .nissan, model: "Lannia", year: 2019, color: .gray, licensePlate: "WCE 337", district: .kahala, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.269452, longitude: -157.778855)),
    Car(make: .nissan, model: "Rogue", year: 2019, color: .black, licensePlate: "EFJ 214", district: .kapahulu, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.282907, longitude: -157.812382)),
    Car(make: .nissan, model: "X-Trail", year: 2019, color: .gray, licensePlate: "RVU 180", district: .alamoana, reason: .stalledVehical, location: CLLocationCoordinate2D(latitude: 21.294401, longitude: -157.841934)),
    Car(make: .nissan, model: "Terra", year: 2019, color: .orange, licensePlate: "WVF 740", district: .kahala, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.267904, longitude: -157.782422)),
    Car(make: .nissan, model: "Elgrand", year: 2019, color: .green, licensePlate: "YDW 223", district: .kakaako, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.296320, longitude: -157.857580)),
    Car(make: .nissan, model: "370Z", year: 2019, color: .gray, licensePlate: "SAJ 204", district: .iwilei, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.321358, longitude: -157.864250)),
    Car(make: .nissan, model: "350Z", year: 2019, color: .black, licensePlate: "EWY 238", district: .kahala, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.272075, longitude: -157.789094)),
    Car(make: .nissan, model: "Maxima", year: 2019, color: .yellow, licensePlate: "WEB 548", district: .alamoana, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.293358, longitude: -157.839270)),
    Car(make: .nissan, model: "Armada", year: 2019, color: .gray, licensePlate: "NVG 935", district: .kaimuki, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.282156, longitude: -157.800580)),
    Car(make: .nissan, model: "Titan", year: 2019, color: .blue, licensePlate: "STD 170", district: .hawaiikai, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.285411, longitude: -157.701999)),
    Car(make: .chevrolet, model: "Spark", year: 2012, color: .red, licensePlate: "SJE 765", district: .alamoana, reason: .stalledVehical, location: CLLocationCoordinate2D(latitude: 21.289460, longitude: -157.840655)),
    Car(make: .chevrolet, model: "Bolt", year: 2019, color: .blue, licensePlate: "EXS 885", district: .kakaako, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.296872, longitude: -157.852800)),
    Car(make: .chevrolet, model: "Malibu", year: 2005, color: .black, licensePlate: "XWB 314", district: .kaimuki, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.281779, longitude: -157.802368)),
    Car(make: .chevrolet, model: "Camaro", year: 1999, color: .orange, licensePlate: "YCD 423", district: .kahala, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.279662, longitude: -157.786245)),
    Car(make: .chevrolet, model: "Corvette", year: 2004, color: .yellow, licensePlate: "GYJ 523", district: .alamoana, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.287681, longitude: -157.840157)),
    Car(make: .chevrolet, model: "Express", year: 2002, color: .white, licensePlate: "GSA 510", district: .iwilei, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.314083, longitude: -157.865938)),
    Car(make: .chevrolet, model: "Trax", year: 2020, color: .gray, licensePlate: "SGV 639", district: .kahala, reason: .stalledVehical, location: CLLocationCoordinate2D(latitude: 21.273264, longitude: -157.782529)),
    Car(make: .chevrolet, model: "Trail Blazer", year: 2019, color: .gray, licensePlate: "NWR 659", district: .kapahulu, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.284043, longitude: -157.810494)),
    Car(make: .chevrolet, model: "Equinox", year: 2013, color: .white, licensePlate: "GEF 847", district: .kaimuki, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.280591, longitude: -157.800036)),
    Car(make: .chevrolet, model: "Blazer", year: 2020, color: .brown, licensePlate: "JPD 792", district: .kahala, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.261579, longitude: -157.789657)),
    Car(make: .chevrolet, model: "Traverse", year: 1996, color: .blue, licensePlate: "GRR 450", district: .hawaiikai, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.286142, longitude: -157.711657)),
    Car(make: .honda, model: "CR-V", year: 2012, color: .red, licensePlate: "FNJ 544", district: .hawaiikai, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.292261, longitude: -157.700750)),
    Car(make: .honda, model: "Civic", year: 2019, color: .blue, licensePlate: "UYN 935", district: .alamoana, reason: .abandonedVechical, location: CLLocationCoordinate2D(latitude: 21.289352, longitude: -157.837727)),
    Car(make: .honda, model: "Accord", year: 2005, color: .black, licensePlate: "NFW 780", district: .kahala, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.264887, longitude: -157.787244)),
    Car(make: .honda, model: "Insight", year: 1999, color: .orange, licensePlate: "TYC 212", district: .kakaako, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.300823, longitude: -157.863196)),
    Car(make: .honda, model: "HR-V", year: 2004, color: .yellow, licensePlate: "YCD 269", district: .kaimuki, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.279201, longitude: -157.799183)),
    Car(make: .honda, model: "Ridgeline", year: 2002, color: .white, licensePlate: "RBF 360", district: .iwilei, reason: .abandonedVechical, location: CLLocationCoordinate2D(latitude: 21.316659, longitude: -157.864240)),
    Car(make: .honda, model: "Fit", year: 2020, color: .gray, licensePlate: "FWT 942", district: .kapahulu, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.277275, longitude: -157.813090)),
    Car(make: .honda, model: "Odyssey", year: 2019, color: .gray, licensePlate: "SVA 629", district: .kahala, reason: .accident, location: CLLocationCoordinate2D(latitude: 21.266058, longitude: -157.785941)),
    Car(make: .honda, model: "Passport", year: 2013, color: .white, licensePlate: "RWP 650", district: .kaimuki, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.277628, longitude: -157.801309)),
    Car(make: .honda, model: "Pilot", year: 2020, color: .brown, licensePlate: "YSF 733", district: .kakaako, reason: .abandonedVechical, location: CLLocationCoordinate2D(latitude: 21.297504, longitude: -157.864032)),
    Car(make: .honda, model: "NSX", year: 1996, color: .blue, licensePlate: "TNU 865", district: .alamoana, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.289626, longitude: -157.840125)),
    Car(make: .honda, model: "Civic Type R", year: 2007, color: .black, licensePlate: "RSN 517", district: .kapahulu, reason: .abandonedVechical, location: CLLocationCoordinate2D(latitude: 21.272750, longitude: -157.817775)),
    Car(make: .audi, model: "A3", year: 2020, color: .red, licensePlate: "VXD 943", district: .kakaako, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.301695, longitude: -157.856846)),
    Car(make: .audi, model: "A4", year: 2020, color: .white, licensePlate: "GJY 673", district: .kaimuki, reason: .abandonedVechical, location: CLLocationCoordinate2D(latitude: 21.274877, longitude: -157.803327)),
    Car(make: .audi, model: "A6", year: 2020, color: .black, licensePlate: "NVF 773", district: .kapahulu, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.273718, longitude: -157.814058)),
    Car(make: .audi, model: "A7", year: 2020, color: .black, licensePlate: "YYT 127", district: .kahala, reason: .accident, location: CLLocationCoordinate2D(latitude: 21.265808, longitude: -157.789462)),
    Car(make: .audi, model: "A8", year: 2020, color: .white, licensePlate: "RTR 907", district: .kakaako, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.291166, longitude: -157.856325)),
    Car(make: .audi, model: "A5", year: 2020, color: .brown, licensePlate: "RFX 423", district: .kahala, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.267448, longitude: -157.785396)),
    Car(make: .audi, model: "Q5", year: 2020, color: .white, licensePlate: "JFV 336", district: .alamoana, reason: .abandonedVechical, location: CLLocationCoordinate2D(latitude: 21.292771, longitude: -157.836879)),
    Car(make: .audi, model: "Q3", year: 2020, color: .orange, licensePlate: "BTC 255", district: .kaimuki, reason: .carRepo, location: CLLocationCoordinate2D(latitude: 21.280806, longitude: -157.796272)),
    Car(make: .audi, model: "Q7", year: 2020, color: .brown, licensePlate: "VYN 871", district: .iwilei, reason: .illegalPark, location: CLLocationCoordinate2D(latitude: 21.316659, longitude: -157.864240)),
    Car(make: .audi, model: "Q8", year: 2020, color: .white, licensePlate: "SSP 685", district: .hawaiikai, reason: .accident, location: CLLocationCoordinate2D(latitude: 21.286738, longitude: -157.715541)),
    Car(make: .audi, model: "TT", year: 2020, color: .gray, licensePlate: "PNS 325", district: .alamoana, reason: .stalledVehical, location: CLLocationCoordinate2D(latitude: 21.295776, longitude: -157.844201)),
    Car(make: .audi, model: "RS 6 Avant", year: 2020, color: .blue, licensePlate: "JND 560", district: .hawaiikai, reason: .abandonedVechical, location: CLLocationCoordinate2D(latitude: 21.283407, longitude: -157.715715))
    ]

class Car {
    
    enum Make: String {
        case toyota = "Toyota"
        case nissan = "Nissan"
        case honda = "Honda"
        case chevrolet = "Chevrolet"
        case audi = "Audi"
    }
    enum Color: String {
        case white = "White"
        case black = "Black"
        case red = "Red"
        case blue = "Blue"
        case green = "Green"
        case yellow = "Yellow"
        case gray = "Gray"
        case purple = "Purple"
        case orange = "Orange"
        case brown = "Brown"
    }
    enum ReasonForTow: String {
        case illegalPark = "Parked illegally"
        case abandonedVechical = "Abandoned Vechical"
        case stalledVehical = "Vehical is inoperable"
        case accident = "Vehical accident"
        case carRepo = "Vehical Reposession"
    }
    var make: Make
    var model: String
    var year: Int
    var color: Color
    var licensePlate: String
    var district: District
    // display reason short summary
    var reason: ReasonForTow
    // long summary of why car needs to be towed
    var reasonForTow: String
    // car coordinates
    var location: CLLocationCoordinate2D
    
    init(make: Make, model: String, year: Int, color: Color, licensePlate: String, district: District, reason: ReasonForTow, location: CLLocationCoordinate2D) {
        self.make = make
        self.model = model
        self.year = year
        self.color = color
        self.licensePlate = licensePlate
        self.district = district
        self.reason = reason
        if (reason.rawValue == "Parked illegally") {
            self.reasonForTow = "\(licensePlate) \(color.rawValue) \(year) \(model) was found parked in an illegal zone within the district \(district.rawValue)."
        } else if (reason.rawValue == "Abandoned Vechical") {
            self.reasonForTow = "\(licensePlate) \(color.rawValue) \(year) \(model) was abandoned in the \(district.rawValue) district for over 30 days."
        } else if (reason.rawValue == "Vehical is inoperable") {
            self.reasonForTow = "\(licensePlate) \(color.rawValue) \(year) \(model) broke down in the \(district.rawValue) district and is inoperable."
        } else if (reason.rawValue == "Vehical accident") {
            self.reasonForTow = "\(licensePlate) \(color.rawValue) \(year) \(model) was involved in an accident in the \(district.rawValue) district and is inoperable. Vehical has been requested to be removed by authorities"
        } else {
            self.reasonForTow = "\(licensePlate) \(color.rawValue) \(year) \(model) has evaded payments and is in the \(district.rawValue) district. Lending company has requested repossession of \(licensePlate)"
        }
        self.location = location
    }
    
}
