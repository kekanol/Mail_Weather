//
//  ViewController.swift
//  MailWeather
//
//  Created by Константин Емельянов on 13.11.2020.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate  {
    
    let searchBar = UISearchBar()
    let centralView = CentralView()
    let presenter = MailWeatherPresenter()
    
    var searchActive : Bool = false
    private var spacing: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        view.addSubview(centralView)
        if searchBar.text == "" {
            centralView.isHidden = true
        }
        
        centralView.cityName.text = presenter.data.cityName
        centralView.icon.text = presenter.data.icon
        centralView.temperature.text = presenter.data.temperature
    }
    
    
    func searchBarTextDidBeginEditing(_searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.textDidChange(searchText: searchText)
        centralView.isHidden = false
        if searchBar.text == "" {
            centralView.isHidden = true
        }
    }
    
    func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        centralView.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: spacing * -1).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacing).isActive = true
        
        centralView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor).isActive = true
        centralView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor).isActive = true
        centralView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        centralView.heightAnchor.constraint(equalTo: centralView.widthAnchor).isActive = true
        
    }

    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
}






