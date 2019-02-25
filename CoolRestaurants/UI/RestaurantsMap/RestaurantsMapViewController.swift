//
//  RestaurantsMapViewController.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import UIKit

class RestaurantsMapViewController: BaseViewController {

    private var restaurantsMapUserActionsListener: RestaurantsMapUserActionsListener? {
        return userActionsListener as? RestaurantsMapUserActionsListener
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Theme.theme(self)

        self.title = Strings.App.Mainview.title
    }

}

extension RestaurantsMapViewController: RestaurantsMapView {

    func showRestaurants(restaurants: [Restaurant]) {

    }

}
