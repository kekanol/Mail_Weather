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
            if let list = data?["list"] as? Array<NSDictionary>{
                for item  in list {
                    var elem = DetailModel(date: "", weather: "", temperature: 0)
                    
                    if let main = item["main"] as? NSDictionary {
                        if let temperature = main["temp"] as? Double{
                            elem.temperature = Int(temperature.rounded() - 273)
                        }
                    }
                    
                    if let weather = item["weather"] as? Array<NSDictionary> {
                        if let main = weather[0]["main"] as? String {
                            elem.weather = main.convertToEmoji()
                        }
                    }
                    
                    if let dt = item["dt"] as? Int {
                        let date = Date(timeIntervalSince1970: TimeInterval(dt))
                        elem.date = String("\(date)".dropLast(9))
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
    }
    
    func loading() {
        print("loading")
    }
}
    
