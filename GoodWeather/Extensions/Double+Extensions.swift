//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by AnhNguyen on 10/08/2022.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}
