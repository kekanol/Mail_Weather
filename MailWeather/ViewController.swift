//
//  ViewController.swift
//  MailWeather
//
//  Created by Константин Емельянов on 13.11.2020.
//

import UIKit

class ViewController: UIViewController {

    let searchBar = UISearchBar()
    let cityView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(searchBar)
        
        view.addSubview(cityView)
    }

    func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        cityView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
        
            cityView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            cityView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            cityView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            cityView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
}

