//
//  RestaurantsDetailPresenter.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import RxSwift

class RestaurantsDetailPresenter: BasePresenter {

    private let restaurant: Restaurant
    private let router: RestaurantsDetailRouter
    private var restaurantsDetailView: RestaurantsDetailView? { return view as? RestaurantsDetailView }

    init(restaurant: Restaurant, router: RestaurantsDetailRouter) {
        self.restaurant = restaurant
		self.router = router
    }
    
    override func initialize() {
        super.initialize()
        self.restaurantsDetailView?.showTitle(title: restaurant.name)
        self.restaurantsDetailView?.showRestaurant(restaurant: restaurant)
    }
    
}

extension RestaurantsDetailPresenter: RestaurantsDetailUserActionsListener { }
