//
//  RestaurantsDetailViewController.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class RestaurantsDetailViewController: BaseViewController {
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    private var restaurantsDetailUserActionsListener: RestaurantsDetailUserActionsListener? {
        return userActionsListener as? RestaurantsDetailUserActionsListener
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Theme.theme(self)
    }

}

extension RestaurantsDetailViewController: RestaurantsDetailView {
    
    func showRestaurant(restaurant: Restaurant) {
        self.categoryLabel.text = restaurant.categoryName
        self.addressLabel.text = restaurant.address
        self.categoryImageView.sd_setImage(with: restaurant.caregoryIconURL, completed: nil)
    }

    func showTitle(title: String) {
        self.title = title
    }
}
