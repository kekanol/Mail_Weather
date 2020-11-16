//
//  DetailViewController.swift
//  MailWeather
//
//  Created by Константин Емельянов on 16.11.2020.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let presenter = DetailPresenter()
    var cityName: String?
    var data: [DetailModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
//        print(data.count)
        self.title = cityName
        self.view.addSubview(tableView)
    }

    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .black
        cell.textLabel?.text = "\(data[indexPath.row].date)"
        print(cell)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.loadData(cityName: self.cityName ?? "")
    }
    
    func setupConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
}

