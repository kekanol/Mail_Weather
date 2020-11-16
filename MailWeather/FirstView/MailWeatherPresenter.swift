//
//  MailWeatherPresenter.swift
//  MailWeather
//
//  Created by Константин Емельянов on 15.11.2020.
//

import Alamofire

class MailWeatherPresenter {
    
    
    weak var view: FirstViewController?
    
    private let urlHeader = "https://api.openweathermap.org/data/2.5/weather?q="
    private var search: String? 

    func textDidChange(searchText: String) {
        animate()
        makeRequest(name: searchText)
        search = searchText
    }
    
    func makeRequest(name: String) {
        AF.request(self.urlHeader + "\(name)"  + "&appid=" + apiKey).responseJSON { response in
            
            if (response.error != nil) {
                self.view?.centralView.cityName.text = "!АШЫПКА! !НИТ ИНЕТУ!"
            }
            
            let data = response.value as? NSDictionary
            if let cod = data?["cod"] as? Int {
                if cod == 200 {
                    if let cityName = data?["name"] as? String {
                        self.view?.centralView.cityName.text = cityName
                    }
                    if let main = data?["main"] as? NSDictionary {
                        if let temperature = main["temp"] as? Double {
                            let temp: Int = Int((temperature - 273).rounded())
                            self.view?.centralView.temperature.text = "\(temp)"
                        }
                    }
                    if let weather = data?["weather"] as? Array<Any>{
                        if let whr = weather[0] as? NSDictionary {
                            if let main = whr["main"] as? String {
                                self.view?.centralView.icon.text = self.convertToEmoji(main)
                            }
                        }
                    }
                } 
            } else {
                self.view?.centralView.cityName.text = "ГОРОД ПРОПАЛ"
                self.view?.centralView.icon.text = ""
                self.view?.centralView.temperature.text = ""
            }
        }
    }
    
    @ objc func show() {
        self.view?.centralView.tapAction()
        let destination = DetailViewController()
        destination.cityName = self.search
        self.view?.navigationController?.setNavigationBarHidden(false, animated: true)
        self.view?.navigationController?.pushViewController(destination, animated: true)
    }
    
    func animate() {
        UIView.animate(withDuration: 0.5) {
            self.view?.centralView.alpha = 1
            if self.view?.searchBar.text == "" {
                self.view?.centralView.cityName.text = ""
                self.view?.centralView.icon.text = ""
                self.view?.centralView.temperature.text = ""
                self.view?.centralView.alpha = 0
            }
        }
    }
    
    func convertToEmoji(_ str: String) -> String {
        switch str {
        case "Clouds":
            return "☁️"
        case "Clear":
            return "☀️"
        case "Rain":
            return "🌧"
        case "Snow":
            return "🌨"
        default:
            print(str)
            return str
        }
        
    }
}
