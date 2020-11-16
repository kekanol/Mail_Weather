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
                self.view?.centralView.cityName.text = "NO CONNECTION"
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
                            self.view?.centralView.temperature.text = "\(temp)".addCelcium()
                        }
                    }
                    if let weather = data?["weather"] as? Array<NSDictionary>{
                        if let main = weather[0]["main"] as? String {
                            self.view?.centralView.icon.text = main.convertToEmoji()
                        }
                    }
                } 
            } else {
                self.view?.centralView.cityName.text = "NO CITY LIKE THAT"
                self.view?.centralView.icon.text = ""
                self.view?.centralView.temperature.text = ""
            }
        }
    }
    
    @ objc func show() {
        self.view?.centralView.tapAction()
        
        if self.search == self.view?.centralView.cityName.text {
            
            let destination = DetailViewController()
            destination.cityName = self.search
            self.view?.navigationController?.setNavigationBarHidden(false, animated: true)
            self.view?.navigationController?.pushViewController(destination, animated: true)
            
        } else {
            
            let t = self.view?.centralView.cityName.text
            UIView.animate(withDuration: 0.6) {
                self.view?.centralView.cityName.text = "ENTER WRIGHT"
                self.view?.centralView.cityName.text = t
            }
        }        
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
}
