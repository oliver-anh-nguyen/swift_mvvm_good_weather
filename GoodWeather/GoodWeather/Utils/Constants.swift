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
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&lat=35&lon=139&appid=94fa1023c1b50a3f2a55e58ef4889b39")!
        }
    }
}
