//
//  RestaurantsMapPresenter.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import RxSwift

class RestaurantsMapPresenter: BasePresenter {

    private let router: RestaurantsMapRouter
    private let restaurantRepository: RestaurantRepository
    private var restaurantsMapView: RestaurantsMapView? { return view as? RestaurantsMapView }
    private let disposeBag = DisposeBag()

    init(restaurantRepository: RestaurantRepository, router: RestaurantsMapRouter) {
		self.restaurantRepository = restaurantRepository
        self.router = router
    }

    override func initialize() {
        super.initialize()
    }

    private func fetchRestaurants() {
        self.restaurantRepository.getRestaurants().subscribe(onSuccess: { restaurants in
            self.restaurantsMapView?.showRestaurants(restaurants: restaurants)
        }, onError: { _ in
            // handle error
        }).disposed(by: self.disposeBag)
    }
}

extension RestaurantsMapPresenter: RestaurantsMapUserActionsListener { }
