//
//  Constants.swift
//  GoodWeather
//
//  Created by AnhNguyen on 10/08/2022.
//

import Foundation

struct Constants {
    struct Urls {
        static func urlForWeatherByCity(city: String) -> URL {
            let unit = (UserDefaults.standard.value(forKey: "unit") as? String) ?? "imperial"
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&lat=35&lon=139&appid=3ce5540ea1283938cbdab74f840ba13e&units=\(unit)")!
        }
    }
}
