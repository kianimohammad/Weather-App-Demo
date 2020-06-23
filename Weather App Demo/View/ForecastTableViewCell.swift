//
//  ForecastTableViewCell.swift
//  Weather App Demo
//
//  Created by Mohammad Kiani on 2020-06-20.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var highLbl: UILabel!
    @IBOutlet weak var lowLbl: UILabel!
    @IBOutlet weak var feelsLbl: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setForecast(forecast: ForecastData) {
        dateLbl.text = forecast.dateString
        timeLbl.text = forecast.hour
        
        tempLbl.text = forecast.dayTemp
        feelsLbl.text = forecast.feelTemp
        highLbl.text = forecast.highTemp
        lowLbl.text = forecast.lowTemp
        
        loadImage(with: forecast.iconeCode)
        
    }
    
    func loadImage(with iconeCode: String) {
        if let iconUrl = WeatherURLManager.getWeatherIconURL(iconCode: iconeCode) {
            let session = URLSession.shared
            
            let task = session.dataTask(with: iconUrl) { (data, response, error) in
                if data != nil {
                    DispatchQueue.main.async {
                        self.iconImageView.image = UIImage(data: data!)
                    }
                }
            }
            task.resume()
        }
    }
}
