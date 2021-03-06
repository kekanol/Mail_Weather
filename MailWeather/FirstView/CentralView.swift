//
//  CentralView.swift
//  MailWeather
//
//  Created by Константин Емельянов on 15.11.2020.
//

import UIKit

class CentralView: UIView {
    
    let cityName = UILabel()
    let temperature = UILabel()
    let icon = UILabel()
    
    private let screenSize = UIScreen.main.bounds
    private let spacing: CGFloat = 20
    
    override func layoutSubviews() {
        setupView()
                        
        self.addSubview(cityName)
        self.addSubview(temperature)
        self.addSubview(icon)
        
        setupConstraints()
    }    
    
    func setupView()  {
        self.backgroundColor = .white
        let shadowPath0 = UIBezierPath(roundedRect: self.bounds, cornerRadius: spacing)
        layer.shadowPath = shadowPath0.cgPath
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = spacing / 4
        layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.cornerRadius = spacing
        self.alpha = 0
        
        setupCityName()
        setupTemperature()
        setupIcon()
    }
    
    
    func setupConstraints() {
        cityName.translatesAutoresizingMaskIntoConstraints = false
        temperature.translatesAutoresizingMaskIntoConstraints = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        cityName.topAnchor.constraint(equalTo: self.topAnchor, constant: spacing).isActive = true
        cityName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: spacing).isActive = true
        cityName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: spacing * -1).isActive = true
        
        temperature.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: spacing).isActive = true
        temperature.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: spacing).isActive = true
        temperature.heightAnchor.constraint(equalTo: cityName.heightAnchor).isActive = true
        temperature.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: spacing * -1).isActive = true
        temperature.widthAnchor.constraint(equalTo: icon.widthAnchor).isActive = true
        
        icon.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: spacing).isActive = true
        icon.leadingAnchor.constraint(equalTo: temperature.trailingAnchor, constant: spacing).isActive = true
        icon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: spacing * -1).isActive = true
        icon.heightAnchor.constraint(equalTo: temperature.heightAnchor).isActive = true
        icon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: spacing * -1).isActive = true
    }
    
    func tapAction() {
        UIView.animate(withDuration: 0.3) {
            self.backgroundColor = .gray
            self.alpha = 0.5
        }
        
        UIView.animate(withDuration: 0.3) {
            self.backgroundColor = .white
            self.alpha = 1
        }
    }
    
    func setupCityName() {
        cityName.text = ""
        cityName.textAlignment = .center
        cityName.font = UIFont.systemFont(ofSize: 40)
        cityName.lineBreakMode = .byWordWrapping
        cityName.numberOfLines = 0
    }
    
    func setupTemperature() {
        temperature.text = ""
        temperature.textAlignment = .center
        temperature.font = UIFont.systemFont(ofSize: 60)
    }
    
    func setupIcon() {
        icon.text = ""
        icon.textAlignment = .center
        icon.font = UIFont.systemFont(ofSize: 60)
    }
}

