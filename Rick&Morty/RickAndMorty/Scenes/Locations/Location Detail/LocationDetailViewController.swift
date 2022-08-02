//
//  LocationDetailViewController.swift
//  RickAndMorty
//
//  Created by Filip Haskovec on 26.07.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

final class LocationDetailViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private lazy var backgroundView: UIView = {
        let view = UIBackgroundGradientView()
        view.backgroundColor = .appBackgroundGradientTop
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let characters: [Character] = {
        // Initialize with 100 Character mocks.
        (0...99).map { _ in
            Character.mock
        }
    }()
    
    private let location: Location = {
        Location.mock
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    
}

// MARK: - Setup
private extension LocationDetailViewController {
    func setup() {
        setupView()
    }

    func setupView() {
        view.insertSubview(backgroundView, at: 0)
        tableView.backgroundColor = .appBackgroundGradientTop
        tableView.register(LocationDetailCharacterCell.self)
        tableView.register(LocationDetailCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Table view data source
extension LocationDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.dynamicFont = .appSectionTitle
        label.textColor = .appTextSectionTitle
        headerView.backgroundColor = .appBackgroundGradientTop
        label.backgroundColor = .appBackgroundGradientTop
        
        switch(section){
        case 0:
            label.text = "Information"
        case 1:
            label.text = "Residents"
        default:
            label.text = "Error"
        }
                
        headerView.addSubview(label)
                
        return headerView
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return 1
        case 1:
            return characters.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section==0){
            let cell: LocationDetailCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: location)
            return cell
        } else{
            let cell: LocationDetailCharacterCell = tableView.dequeueReusableCell(for: indexPath)
            let character = characters[indexPath.row]

            cell.configure(with: character)

            return cell
        }
    }
}
