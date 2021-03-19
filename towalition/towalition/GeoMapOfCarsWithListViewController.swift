//
//  GeoMapOfCarsWithListViewController.swift
//  towalition
//
//  Created by Nathan Hester on 3/11/21.
//

import UIKit
import MapKit

var carsNearYouGlobal: [Car] = []


class GeoMapOfCarsWithListViewController: UIViewController {
    @IBOutlet private var mapView: MKMapView!

    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var viewNearJobsButton: UIButton!
    
    @IBOutlet weak var driverJobs: UILabel!
    var closeToDriverJobs: [Car]?
    var driver: Driver?
    var hamburgerMenuIsVisible = false
    
    // menu functionality
    @IBAction func menuPressed(_ sender: Any) {
        if !hamburgerMenuIsVisible {
            leadingC.constant = 150
            trailingC.constant = 150
            hamburgerMenuIsVisible = true
        } else {
            leadingC.constant = 0
            trailingC.constant = 0
            hamburgerMenuIsVisible = false
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                })
    }
    
    @IBAction func logOut(_ sender: Any) {
        UserDefaults.standard.setLoggedIn(value: false)
    }
    
    // unwind for "Profile"
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var jobs = 0
        let dID = UserDefaults.standard.getDriverID()
        driver = getDriverById(id: dID)
        let latitude = driver!.latitude
        let longitude = driver!.longitude
        
        // Set initial location by the driver
  
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        mapView.centerToLocation(initialLocation)
        let oahuCenter = CLLocation(latitude: 21.4765, longitude: -157.8647)
            let region = MKCoordinateRegion(
              center: oahuCenter.coordinate,
              latitudinalMeters: 50000,
              longitudinalMeters: 60000)
            mapView.setCameraBoundary(
              MKMapView.CameraBoundary(coordinateRegion: region),
              animated: true)
            let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 5000)
            mapView.setCameraZoomRange(zoomRange, animated: true)
        
        // initialize the array of jobs close to this driver
        closeToDriverJobs = carsTemp.filter({(value:Car) -> Bool in return value.district.rawValue == driver!.district.rawValue})
        carsNearYouGlobal = carsTemp.filter({(value:Car) -> Bool in return value.district.rawValue == driver!.district.rawValue})
        jobs = closeToDriverJobs!.count
        viewNearJobsButton.setTitle("VIEW \(jobs) JOBS", for: .normal)
        // map annotations for available jobs
        for i in 0..<closeToDriverJobs!.count {
            let geoAndReasonCarInfo = GeoCar(title: closeToDriverJobs![i].licensePlate, locationName: closeToDriverJobs![i].reason.rawValue, discipline: closeToDriverJobs![i].make.rawValue, coordinate: closeToDriverJobs![i].location)
            mapView.addAnnotation(geoAndReasonCarInfo)
            
        }
        // add driver annotation
        let geoDriver = GeoCar(title: driver!.username, locationName: "You are here", discipline: "Driver", coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        mapView.addAnnotation(geoDriver)
        
        driverJobs.text = "Aloha \(driver!.firstname) \(driver!.lastname), there are \(jobs) available jobs with a max ETA of 10 minutes in your vicinity."
        
    }
    
    // MARK: - Navigation

}

// map configuration
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 45000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

