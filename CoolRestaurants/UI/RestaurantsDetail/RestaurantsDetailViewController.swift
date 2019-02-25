//
//  RestaurantsDetailViewController.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import UIKit

class RestaurantsDetailViewController: BaseViewController {
    
    private var restaurantsDetailUserActionsListener: RestaurantsDetailUserActionsListener? {
        return userActionsListener as? RestaurantsDetailUserActionsListener
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Theme.theme(self)
    }
    
}

extension RestaurantsDetailViewController: RestaurantsDetailView { }
