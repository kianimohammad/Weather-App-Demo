//
//  ForecastTableViewController.swift
//  Weather App Demo
//
//  Created by Mohammad Kiani on 2020-06-20.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ForecastTableViewController: UITableViewController {
    
    var cityName: String!
    var forecasts: [ForecastData]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func setCity(city: String) {
        cityName = city
        self.title = city
        
        // URL
        if let forecastURL = WeatherURLManager.getForecastWeatherURL(city: city) {
            
            // session
            let session = URLSession.shared
            // task
            let task = session.dataTask(with: forecastURL) { (data, response, error) in
                if data != nil {
                    if let forecastData = try? JSON(data: data!) {
                        self.loadForecast(data: forecastData)
                    }
                }
            }
            
            // start the task
            task.resume()
            
        }
    }
    
    func loadForecast(data: JSON) {
        forecasts = [ForecastData]()
        
        let forecastList = data["list"].arrayValue
        
        for jsonItem in forecastList {
            forecasts.append(ForecastData(city: cityName, data: jsonItem))
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return forecasts?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastTableViewCell
        cell.setForecast(forecast: forecasts[indexPath.row])
        
        return cell
    }

}
