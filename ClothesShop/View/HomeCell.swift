//
//  HomeCell.swift
//  ClothesShop
//
//  Created by ngovantucuong on 11/22/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var subHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
