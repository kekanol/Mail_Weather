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
    
    func loadData(cityName: String) -> ( Void ) {
        
        AF.request(self.urlheader + cityName + "&appid=" + apiKey).responseJSON { responce in
            let data = responce.value as? NSDictionary
            if let list = data?["list"] as? Array<NSDictionary>{
                for item  in list {
                    
                    var elem = DetailModel(date: Date(), weather: "", temperature: 0)
                    
                    if let main = item["main"] as? NSDictionary {
                        if let temperature = main["temp"] as? Int{
                            elem.temperature = temperature
                        }
                    }
                    
                    if let weather = item["weather"] as? Array<NSDictionary> {
                        if let main = weather[0]["main"] as? String {
                            elem.weather = main.convertToEmoji()
                        }
                    }
                    
                    if let dt = item["dt_txt"] as? Date {
                        elem.date = dt
                    }
                    
                    self.view?.data.append(elem)
                }  
//                print(self.view?.data)
                
                return self.reload()
            }
        }
        
        return print("kek")

    }
    
    func reload() {
        self.view?.tableView.reloadData()
    }
}
    
