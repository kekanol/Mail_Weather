//
//  DetailViewController.swift
//  MailWeather
//
//  Created by Константин Емельянов on 16.11.2020.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource {
    
    let tableView = UITableView()
    let presenter = DetailPresenter()
    var cityName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        tableView.dataSource = self
        self.title = cityName
        self.view.addSubview(tableView)
    }

    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.loadData(cityName: self.cityName ?? "")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DetailTableViewCell()
        cell.dateLabel.text = "\(presenter.data[indexPath.row].date)"
        cell.iconLabel.text = "\(presenter.data[indexPath.row].weather)"
        cell.tempLabel.text = "\(presenter.data[indexPath.row].temperature)"
        return cell
    }
    
    
    func setupConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
}

