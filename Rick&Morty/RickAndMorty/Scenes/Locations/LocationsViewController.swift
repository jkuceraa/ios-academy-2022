//
//  LocationsViewController.swift
//  RickAndMorty
//
//  Created by Filip Haskovec on 26.07.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

final class LocationsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var locations: [Location] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        for _ in 0...100 {
            locations.append(Location.mock)
        }
        
        tableView.register(LocationListItemCell.self)
        tableView.backgroundColor = .appBackgroundGradientTop
        
    }
}

extension LocationsViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LocationListItemCell = tableView.dequeueReusableCell(for: indexPath)
        let location = locations[indexPath.row]
        cell.titleLabel.text = location.name
        cell.descriptionLabel.text = location.type
        return cell
    }
}
