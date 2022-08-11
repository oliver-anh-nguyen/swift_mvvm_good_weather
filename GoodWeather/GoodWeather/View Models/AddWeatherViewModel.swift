//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by AnhNguyen on 10/08/2022.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        let weatherResponse = Resource<WeatherResponse>(url: weatherURL) { data in
            let res = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return res
        }
        
        WebService().load(resource: weatherResponse) { result in
            if let data = result {
                let vm = WeatherViewModel(weather: data)
                completion(vm)
            }
        }
    }
}
