//
//  LocationDetailCharacterCell.swift
//  RickAndMorty
//
//  Created by Jiri Kucera on 29.07.2022.
//  Copyright © 2022 STRV. All rights reserved.
//

import UIKit

class LocationDetailCharacterCell: UITableViewCell{
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }
    
    
    
    func configure(with character: Character) {
        nameLabel.text = character.name
        typeLabel.text = character.species
    }
}

private extension LocationDetailCharacterCell {
    func setupView() {
        backgroundColor = .appBackgroundItem

        nameLabel.dynamicFont = .appItemLargeTitle
        nameLabel.textColor = .appTextItemTitle

        typeLabel.dynamicFont = .appItemDescription
        typeLabel.textColor = .appTextBody
    }
}


extension LocationDetailCharacterCell: NibLoadableView{
    
}
