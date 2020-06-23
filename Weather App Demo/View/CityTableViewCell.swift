//
//  CityTableViewCell.swift
//  Weather App Demo
//
//  Created by Mohammad Kiani on 2020-06-19.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var cityIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCity(to city: String) {
        cityLbl.text = city
        
        // creating a weatherURL
        if let weatherURL = WeatherURLManager.getCityWeatherURL(for: city) {
            
            // create a session
            let session = URLSession.shared
            
            // create a task
            let task = session.dataTask(with: weatherURL) { (data, response, error) in
                if data != nil {
                    // load temprature
                    if let weatherData = try? JSON(data: data!) {
                        let tempValue = weatherData["main"]["temp"].intValue
                        self.loadIcon(with: weatherData)
//                        print(weatherData)
                        // update UI
                        DispatchQueue.main.async {
                            self.tempLbl.text = "\(tempValue)º"
                        }
                    }
                    
                }
            }
            
            // start the task
            task.resume()
        }
    }
    
    func loadIcon(with weatherData: JSON) {
        let weatherArray = weatherData["weather"].arrayValue
        let iconCode = weatherArray[0]["icon"].stringValue
        
        // passing the iconCode to the getWeatherIconURL method
        if let iconUrl = WeatherURLManager.getWeatherIconURL(iconCode: iconCode) {
            
            // create a session
            let session = URLSession.shared
            // task
            let task = session.dataTask(with: iconUrl) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.cityIcon.image = UIImage(data: data)
                    }
                }
            }
            
            // start the task
            task.resume()
        }
    }

}
