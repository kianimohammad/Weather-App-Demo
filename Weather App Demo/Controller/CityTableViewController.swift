//
//  CityTableViewController.swift
//  Weather App Demo
//
//  Created by Mohammad Kiani on 2020-06-19.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
//    var cities: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cities = ["Toronto", "Paris", "Vancouver", "Montreal", "London"]

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
        return cities?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as! CityTableViewCell

        cell.setCity(to: cities?[indexPath.row] ?? "")

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let forecastTVC = segue.destination as? ForecastTableViewController {
            let cityIndex = tableView.indexPath(for: sender as! UITableViewCell)
            forecastTVC.setCity(city: cities![cityIndex!.row])
        }
    }
    
    @IBAction func unwindToCityList(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        tableView.reloadData()
    }
    

}
