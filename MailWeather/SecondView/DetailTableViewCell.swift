//
//  DetailTableViewCell.swift
//  MailWeather
//
//  Created by Константин Емельянов on 16.11.2020.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    let dateLabel = UILabel()
    let tempLabel = UILabel()
    let iconLabel = UILabel()
    var backColor: UIColor?
    
    private let spacing: CGFloat = 10
    
    override func layoutSubviews() {
        setupUI()
    }
    
    func setupUI() {
        self.addSubview(dateLabel)
        self.addSubview(tempLabel)
        self.addSubview(iconLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: spacing),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: spacing),
            dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1 * spacing),
            
            tempLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: spacing),
            tempLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: spacing),
            tempLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1 * spacing),
            tempLabel.widthAnchor.constraint(equalToConstant: (self.bounds.width / 6)),

            iconLabel.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: spacing), 
            iconLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: spacing),
            iconLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1 * spacing),
            iconLabel.widthAnchor.constraint(equalTo: tempLabel.widthAnchor),
            iconLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -1 * spacing)

        ].forEach({
            $0.isActive = true
        })
    }
}
