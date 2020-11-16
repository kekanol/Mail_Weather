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
    
    
    func loadData(cityName: String) {
        
        AF.request(self.urlheader + cityName + "&appid=" + apiKey).responseJSON { responce in
            let data = responce.value as? NSDictionary
            if let list = data?["list"] as? Array<NSDictionary>{
                print(list)
                for item  in list {
                    if let main = item["main"] as? NSDictionary {
                        if let temperature = main["temp"] {
                            print(temperature)
                        }
                    }
                    
                    if let weather = item["weather"] as? Array<NSDictionary> {
                        if let main = weather[0]["main"] as? String {
                            print(main)
                        }
                    }
                    
                    if let dt = item["dt_txt"] as? String {
                        print(dt)
                    }
                }   
            }
        }
    }
}
    
