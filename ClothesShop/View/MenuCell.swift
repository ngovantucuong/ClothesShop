//
//  MenuCell.swift
//  ClothesShop
//
//  Created by ngovantucuong on 11/23/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

   
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
