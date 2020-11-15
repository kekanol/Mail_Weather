//
//  ViewController.swift
//  MailWeather
//
//  Created by Константин Емельянов on 13.11.2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    let collection = UICollectionView()
    
    let presenter = MailWeatherPresenter()
    
    var searchActive : Bool = false
    var filtered:[WeatherCellModel] = []
    private var spacing: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        presenter.view = self
        
        view.addSubview(searchBar)
        view.addSubview(collection)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return presenter.data.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MailCollectionCell()
        if(searchActive){
            cell.cityName.text = filtered[indexPath.row].cityName
            cell.icon.text = filtered[indexPath.row].icon
            cell.temperature.text = filtered[indexPath.row].currentTemperature
        } else {
            cell.cityName.text = presenter.data[indexPath.row].cityName
            cell.icon.text = presenter.data[indexPath.row].icon
            cell.temperature.text = presenter.data[indexPath.row].currentTemperature
        }
        return cell
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
        
        //            filtered = data.filter({ (text) -> Bool in
        //                let tmp: NSString = text
        //                let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
        //                return range.location != NSNotFound
        //            })
        //            if(filtered.count == 0){
        //                searchActive = false;
        //            } else {
        //                searchActive = true;
        //            }
        //            self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        if(searchActive) {
    //            return filtered.count
    //        }
    //        return data.count;
    //    }
    
    //    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    //    }
    
    
    func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: spacing * -1).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: spacing).isActive = true
        
        collection.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: spacing).isActive = true
        collection.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor).isActive = true
        collection.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }

    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
}






