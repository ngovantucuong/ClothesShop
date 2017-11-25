//
//  MenuController.swift
//  ClothesShop
//
//  Created by ngovantucuong on 11/23/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import Firebase

class MenuController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var contentItem: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }

    private func setupLayout() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
    }
}
