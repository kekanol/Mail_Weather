//
//  Constants.swift
//  MailWeather
//
//  Created by Константин Емельянов on 16.11.2020.
//
import Foundation

let apiKey = "27c029dbed898bbc075ad5c4e972953d"

extension String {
    
    func convertToEmoji() -> String {
        switch self {
        case "Clouds":
            return "☁️"
        case "Clear":
            return "☀️"
        case "Rain":
            return "☔️"
        case "Snow":
            return "❄️"
        default:
            return self
        }
        
    }
    
    func addCelcium() -> String {self + "℃"}
    
    func convertToURLtype() -> String {
        var result = ""
        let split = self.split(separator: " ")
        for elem in split {
            result += elem
            if elem != split.last {
                result += "%20"
            }
        }
        return result
    }
    
}

extension Date {
   func convert() -> String {
        let format = "HH:mm, d MMMM"
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

