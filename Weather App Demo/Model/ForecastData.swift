//
//  ForecastData.swift
//  Weather App Demo
//
//  Created by Mohammad Kiani on 2020-06-20.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import Foundation

var cities: [String]?

class ForecastData {
    var dateString: String
    var cityName: String
    
    var dayTemp: String
    var highTemp: String
    var lowTemp: String
    var feelTemp: String
    
    var hour: String
    
    var iconeCode: String
    
    init(city: String, data: JSON) {
        self.cityName = city
        
        self.dayTemp = "\(data["main"]["temp"].intValue)º"
        self.highTemp = "\(data["main"]["temp_max"].intValue)º"
        self.lowTemp = "\(data["main"]["temp_min"].intValue)º"
        self.feelTemp = "\(data["main"]["feels_like"].intValue)º"
        
        let date = Date(timeIntervalSince1970: data["dt"].doubleValue)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM, dd"
        let hourFormatter = DateFormatter()
        hourFormatter.dateFormat = "h:mm a"
        
        self.dateString = formatter.string(from: date)
        self.hour = hourFormatter.string(from: date)
        
        self.iconeCode = data["weather"].arrayValue[0]["icon"].stringValue
    }
}
