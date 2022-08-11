//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by AnhNguyen on 10/08/2022.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ model: WeatherViewModel) {
        self.cityNameLabel.text = model.city
        self.temperatureLabel.text = "\(model.temperature.formatAsDegree())"
    }
}
