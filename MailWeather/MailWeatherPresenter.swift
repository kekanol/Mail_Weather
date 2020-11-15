//
//  MailWeatherPresenter.swift
//  MailWeather
//
//  Created by Константин Емельянов on 15.11.2020.
//

import Foundation
import Alamofire

class MailWeatherPresenter {
    
    var data: WeatherModel = WeatherModel(cityName: "2", temperature: "3", icon: "♦️")
    weak var view: ViewController?
    
    private let apiKey = "27c029dbed898bbc075ad5c4e972953d"
    
    func textDidChange(searchText: String) {
        print(searchText)
        makeRequest(name: searchText)
        print(self.data)
    }
    
    func makeRequest(name: String) {
        
                AF.request("https://api.openweathermap.org/data/2.5/weather?q=" + "\(name)" + "&appid=" + self.apiKey).responseJSON { response in
                    
                    let data = response.value as? NSDictionary
//                    print(data)
                    if let cityName = data?["name"] as? String {
                        self.data.cityName = cityName
                    }
                    
                    if let main = data?["main"] as? NSDictionary {
                        if let temperature = main["temp"] as? Double {
                            let temp = temperature - 273
                            self.data.temperature = "\(temp)"
                        }
                    }
                    
                    if let weather = data?["weather"] as? Array<Any>{
                        if let whr = weather[0] as? NSDictionary {
                            if let main = whr["main"] as? String {
                                self.data.icon = main
                            }
                        }
                    }
                    print("inside " + "\(self.data)")
                }
                print("------------")
                print("outside " + "\(self.data)")
    }
}
