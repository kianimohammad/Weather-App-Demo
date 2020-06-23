//
//  WeatherManager.swift
//  Weather App Demo
//
//  Created by Mohammad Kiani on 2020-06-19.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import Foundation

class WeatherURLManager {
    
    /// creating a url from a string
    /// - Parameter city: city name in string
    /// - Returns: URL
    static func getCityWeatherURL(for city: String) -> URL? {
        let city = city.replacingOccurrences(of: " ", with: "%20")
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=5822f53158fdf0f22ed4fad25842783b"
        return URL(string: urlString)
    }
    
    
    /// Creating a url for icon
    /// - Parameter iconCode: icone code in string
    /// - Returns: URL
    static func getWeatherIconURL(iconCode: String) -> URL? {
        let urlString = "http://openweathermap.org/img/wn/\(iconCode).png"
        return URL(string: urlString)
    }
    
    
    /// creating a url from city name for different days
    /// - Parameter city: city in string
    /// - Returns: URL
    static func getForecastWeatherURL(city: String) -> URL? {
        let city = city.replacingOccurrences(of: " ", with: "%20")
        let urlString = "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&appid=5822f53158fdf0f22ed4fad25842783b"
        return URL(string: urlString)
    }
}
