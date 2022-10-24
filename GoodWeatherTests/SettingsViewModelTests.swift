//
//  SettingsViewModelTests.swift
//  GoodWeatherTests
//
//  Created by AnhNguyen on 13/08/2022.
//

import XCTest
@testable import GoodWeather

class SettingsViewModelTests: XCTestCase {
    
    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingsVM = SettingsViewModel()
        
    }
    
    func test_display_name() {
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Celcius")
    }

    func test_fahrenheit() {
        
        XCTAssertEqual(settingsVM.selectedUnit, .celsius)
    }

    func test_should_be_able_save() {
        self.settingsVM.selectedUnit = .fahrenheit
        let userDefault = UserDefaults.standard
        XCTAssertNotNil(userDefault.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "unit")
    }
}
