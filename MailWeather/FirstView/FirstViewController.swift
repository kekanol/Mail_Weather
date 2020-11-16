//
//  FirstViewController.swift
//  MailWeather
//
//  Created by Константин Емельянов on 16.11.2020.
//

import UIKit

class FirstViewController: UIViewController, UISearchBarDelegate  {
    
    let searchBar = UISearchBar()
    let centralView = CentralView()
    let presenter = MailWeatherPresenter()
    
    var searchActive : Bool = false
    
    private let spacing: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        
        self.view.backgroundColor = .white
        
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        view.addSubview(centralView)
        
        let tap = UITapGestureRecognizer(target: self.presenter , action: #selector(self.presenter.show))
        centralView.addGestureRecognizer(tap)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.textDidChange(searchText: searchText)
    }
    
    func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        centralView.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: spacing * -1).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacing).isActive = true
        
        centralView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor).isActive = true
        centralView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor).isActive = true
        centralView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(UIScreen.main.bounds.height / 10)).isActive = true
        centralView.heightAnchor.constraint(equalTo: centralView.widthAnchor).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
}
