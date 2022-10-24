//
//  String+Extensions.swift
//  GoodWeather
//
//  Created by AnhNguyen on 10/08/2022.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
