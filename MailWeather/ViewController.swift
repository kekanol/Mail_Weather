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
    private var spacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        view.addSubview(centralView)
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    
    
    func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: spacing * -1).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: spacing).isActive = true
    }

    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
}






