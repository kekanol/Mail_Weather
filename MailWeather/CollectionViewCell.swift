//
//  CollectionViewCell.swift
//  MailWeather
//
//  Created by Константин Емельянов on 15.11.2020.
//

import UIKit

class MailCollectionCell: UICollectionViewCell {
    
    var cityName = UILabel()
    var temperature = UILabel()
    var icon = UILabel()
    
    private var screenSize = UIScreen.main.bounds
    private var spacing: CGFloat = 10
    
    override func layoutSubviews() {
        
        self.layer.cornerRadius = spacing
        self.frame.size = CGSize(width: (screenSize.width - spacing * 3) / 2, height: (screenSize.height - spacing * 3) / 2)
        
        self.addSubview(cityName)
        self.addSubview(temperature)
        self.addSubview(icon)
        
        cityName.translatesAutoresizingMaskIntoConstraints = false
        temperature.translatesAutoresizingMaskIntoConstraints = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        cityName.topAnchor.constraint(equalTo: self.topAnchor, constant: spacing).isActive = true
        cityName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: spacing).isActive = true
        
        temperature.leadingAnchor.constraint(equalTo: cityName.trailingAnchor, constant: spacing).isActive = true
        temperature.topAnchor.constraint(equalTo: self.topAnchor, constant: spacing).isActive = true
        temperature.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: spacing * -1).isActive = true
        temperature.heightAnchor.constraint(equalTo: cityName.heightAnchor).isActive = true
        
        icon.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: spacing).isActive = true
        icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: spacing).isActive = true
        icon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: spacing * -1).isActive = true
        icon.bottomAnchor.constraint(equalTo: self.bottomAnchor , constant: spacing * -1).isActive = true
        
    }
    
}
