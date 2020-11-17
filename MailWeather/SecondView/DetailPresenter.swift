//
//  DetailPresenter.swift
//  MailWeather
//
//  Created by Константин Емельянов on 16.11.2020.
//

import Alamofire

class DetailPresenter {
    
    weak var view: DetailViewController?
    
    private let urlheader = "https://api.openweathermap.org/data/2.5/forecast?q="
    var data: [DetailModel] = []
    
    func loadData(cityName: String) -> ( Void ) {
        
        AF.request(self.urlheader + cityName + "&appid=" + apiKey).responseJSON { responce in
            let data = responce.value as? NSDictionary
            var timeZone = 0
            if let city = data?["city"] as? NSDictionary {
                if let timezone = city["timezone"] as? Int {
                    timeZone = timezone
                }
             }
            
            if let list = data?["list"] as? Array<NSDictionary>{
                for item  in list {
                    var elem = DetailModel(date: "", weather: "", temperature: "")
                    
                    
                    if let main = item["main"] as? NSDictionary {
                        if let temperature = main["temp"] as? Double{
                            elem.temperature = String(Int(temperature.rounded()) - 273).addCelcium()
                        }
                    }
                    
                    if let weather = item["weather"] as? Array<NSDictionary> {
                        if let main = weather[0]["main"] as? String {
                            elem.weather = main.convertToEmoji()
                        }
                    }
                    
                    if let dt = item["dt"] as? Int {
                        let curentTimeZone = TimeZone.current.secondsFromGMT()
                        let curentTime = dt + timeZone - curentTimeZone
                        let date = Date(timeIntervalSince1970: TimeInterval(curentTime))
                        elem.date = date.convert()
                    }
                    self.data.append(elem)
                }                
                return self.reload()
            }
        }
        return self.loading()
    }
    
    func reload() {
        print("reloaded")
        self.view?.tableView.reloadData()
        UIView.animate(withDuration: 0.5) {
            self.view?.tableView.alpha = 1
            self.view?.stackView.alpha = 0
        }
        self.view?.stackView.removeFromSuperview()
    }
    
    func loading() {
        self.view?.animate()
    }
}

