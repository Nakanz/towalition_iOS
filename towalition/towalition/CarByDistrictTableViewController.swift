//
//  CarByDistrictTableViewController.swift
//  towalition
//
//  Created by Nathan Hester on 3/11/21.
//

import UIKit

class CarByDistrictTableViewController: UITableViewController {
    
    var carsInDistrict : [Car]?
    var district : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carsInDistrict!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = carsInDistrict![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: car.make.rawValue, for: indexPath)

         //Configure the cell...
        let yearText = "\(car.year)"
        let towReason = car.reason.rawValue
        
       
        
        cell.textLabel?.text = yearText + " " + car.color.rawValue + " " + car.model
        
        cell.detailTextLabel?.text = car.district.rawValue + " - \(towReason)"
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let carSelectedViewController = segue.destination as? CarSelectedViewController {
           if let indexPath = self.tableView.indexPathForSelectedRow {
               carSelectedViewController.car = carsInDistrict![indexPath.row]
           }
       }
    }
}
