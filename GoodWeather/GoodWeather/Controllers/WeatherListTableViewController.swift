//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by AnhNguyen on 10/08/2022.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let model = weatherListViewModel.modelAt(indexPath.row)
        cell.configure(model)
        return cell
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeather(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSetting(segue: segue)
        }
    }
    
    func prepareSegueForSetting(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("UINavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
    
    func prepareSegueForAddWeather(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("UINavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    func settingDone(vm: SettingsViewModel) {
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
            self.tableView.reloadData()
            self.lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)!
        }
    }
}
