//
//  MailWeatherPresenter.swift
//  MailWeather
//
//  Created by Константин Емельянов on 15.11.2020.
//

import Foundation
import UIKit

class MailWeatherPresenter {

    var data: WeatherModel = WeatherModel(cityName: "2", currentTemperature: "3", icon: "♦️", nextTemperature: [])
    weak var view: ViewController?
    
    
    func textDidChange(searchText: String) {
        <#function body#>
    }
    
    
    
}
