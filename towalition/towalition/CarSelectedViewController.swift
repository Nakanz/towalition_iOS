//
//  CarSelectedViewController.swift
//  towalition
//
//  Created by Nathan Hester on 3/11/21.
//

import UIKit
import MapKit

class CarSelectedViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var licensePlate: UILabel!
    @IBOutlet weak var make: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var district: UILabel!
    @IBOutlet weak var reason: UILabel!
    
    @IBOutlet private var mapView: MKMapView!

    var car: Car?
    
    override func viewWillAppear(_ animated: Bool) {
        if let c = car {
            licensePlate.text = "[\(c.licensePlate)]"
            make.text = "\(c.make.rawValue)"
            model.text = "\(c.model)"
            color.text = "\(c.color.rawValue)"
            year.text = "\(c.year)"
            district.text = "\(c.district.rawValue)"
            reason.text = "\(c.reasonForTow)"
            // MARK: map initialization
            let initialLocation = CLLocation(latitude: c.location.latitude, longitude: c.location.longitude)
            mapView.delegate = self
            mapView.centerToLocation(initialLocation)
            let geoAndReasonCarInfo = GeoCar(title: c.licensePlate + " " + c.reason.rawValue, locationName: c.district.rawValue, discipline: c.make.rawValue, coordinate: c.location)
            let driver = getDriverById(id: UserDefaults.standard.getDriverID())
            let driverCLLoc = CLLocationCoordinate2D(latitude: driver.latitude, longitude: driver.longitude)
            let geoDriver = GeoCar(title: driver.username, locationName: "You are here", discipline: "Driver", coordinate: driverCLLoc)
            
            mapView.addAnnotation(geoAndReasonCarInfo)
            mapView.addAnnotation(geoDriver)
            
            // MARK: route code
            let sourceLocation = driverCLLoc
            let destinationLocation = c.location
            
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            
            let sourceRegion = MKCoordinateRegion(center: sourceLocation, span: span)
            mapView.setRegion(sourceRegion, animated: true)
            
            let destinationRegion = MKCoordinateRegion(center: destinationLocation, span: span)
            mapView.setRegion(destinationRegion, animated: true)

            let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
            let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
            
            let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: sourcePlacemark)
            directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
            directionRequest.transportType = .automobile
            
            let directions = MKDirections(request: directionRequest)
            directions.calculate { (response, error) in
               guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                    return
                }
                let route = response.routes[0]
                self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
                
                let rect = route.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
    }

    // MARK: - MKMapViewDelegate

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(red: 17.0/255.0, green: 147.0/255.0, blue: 255.0/255.0, alpha: 1)
        renderer.lineWidth = 5.0
        return renderer
    }
    
    @IBAction func acceptJob(_ sender: UIButton) {
      
        let title = "Enroute to \( licensePlate!.text ?? "null")"
        let message = "You have accepted this job, dispatch has been notified successfully."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 5000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
