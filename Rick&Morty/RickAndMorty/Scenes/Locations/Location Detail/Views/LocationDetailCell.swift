//
//  LocationDetailCell.swift
//  RickAndMorty
//
//  Created by Jiri Kucera on 30.07.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class LocationDetailCell: UITableViewCell{
    
    @IBOutlet var nameIcon: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeIcon: UIImageView!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var placementIcon: UIImageView!
    @IBOutlet var placementLabel: UILabel!
    
    func configure(with location: Location){
        nameIcon.image = .systemInfoCircle
        nameLabel.text = location.name
        typeIcon.image = .systemGlobe
        typeLabel.text = location.type
        placementIcon.image = .systemRays
        placementLabel.text = location.dimension
        self.setupView()
    }
}

private extension LocationDetailCell{
    func setupView(){
        backgroundColor = .appBackgroundItem
        
        nameLabel.dynamicFont = .appItemLargeTitle
        nameLabel.textColor = .appTextItemTitle
        
        typeLabel.dynamicFont = .appItemLargeTitle
        typeLabel.textColor = .appTextItemTitle
        
        placementLabel.dynamicFont = .appItemLargeTitle
        placementLabel.textColor = .appTextItemTitle
        
        nameIcon.tintColor = .appTextItemTitle
        typeIcon.tintColor = .appTextItemTitle
        placementIcon.tintColor = .appTextItemTitle
    }
}

extension LocationDetailCell: NibLoadableView{
    
}
