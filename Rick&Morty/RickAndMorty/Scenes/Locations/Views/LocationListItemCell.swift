//
//  LocationListItemCell.swift
//  RickAndMorty
//
//  Created by Jiri Kucera on 26.07.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class LocationListItemCell: UITableViewCell{
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
        titleLabel.font = .appItemLargeTitle
        titleLabel.textColor = .label
        
        descriptionLabel.font = .appItemDescription
        descriptionLabel.textColor = .appTextItemTitle
    }
}

extension LocationListItemCell: NibLoadableView{
    
}
