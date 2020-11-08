//
//  CustomTVCell.swift
//  MyPlaces
//
//  Created by Dmitry Grinev on 22.10.2020.
//

import UIKit
import Cosmos

class CustomTVCell: UITableViewCell {

    @IBOutlet weak var imageOfCell: UIImageView!{
        didSet {
            imageOfCell.layer.cornerRadius = imageOfCell.frame.size.height / 2
            imageOfCell.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView! {
        didSet {
            cosmosView.settings.updateOnTouch = false
        }
    }
    

}
