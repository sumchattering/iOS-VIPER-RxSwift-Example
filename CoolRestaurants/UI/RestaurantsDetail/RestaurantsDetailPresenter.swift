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

    private let router: RestaurantsDetailRouter
    private var restaurantsDetailView: RestaurantsDetailView? { return view as? RestaurantsDetailView }

    init(router: RestaurantsDetailRouter) {
		self.router = router
    }
}

extension RestaurantsDetailPresenter: RestaurantsDetailUserActionsListener { }
