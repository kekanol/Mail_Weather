//
//  MailWeatherPresenter.swift
//  MailWeather
//
//  Created by Константин Емельянов on 15.11.2020.
//

import Alamofire

class MailWeatherPresenter {
    
    weak var view: ViewController?
    
    private let apiKey = "27c029dbed898bbc075ad5c4e972953d"
    
    func textDidChange(searchText: String) {
        animate()
        makeRequest(name: searchText)
    }
    
    func makeRequest(name: String) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=" + "\(name)" + "&appid=" + self.apiKey).responseJSON { response in
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
                                self.view?.centralView.icon.text = main
                            }
                        }
                    }
                } 
            } else {
                print("fakap")
//                ???/?????????????? cho delat`????????
                //                UIView.animate(withDuration: 0.5) {
                //                    self.view?.centralView.cityName.text = "No City Like That"
                //                    self.view?.centralView.icon.text = ""
                //                    self.view?.centralView.temperature.text = ""
                //                }
            }
        }
    }
    
    @ objc func show() {
        self.view?.centralView.tapAction()
        let destination = DetailViewController()
//        print(self.view?.navigationController)
        //TODO make self.view?.navigationController become not nil
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
}
