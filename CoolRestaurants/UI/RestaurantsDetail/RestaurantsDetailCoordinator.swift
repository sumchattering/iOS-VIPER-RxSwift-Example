//
//  RestaurantsDetailCoordinator.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import UIKit

class RestaurantsDetailCoordinator: BaseCoordinator {

    private let restaurant: Restaurant

    init(_ restaurant: Restaurant, navigationController: UINavigationController?) {
        self.restaurant = restaurant
        super.init(navigationController)
    }

    override func setup() -> UIViewController {
        let viewController = RestaurantsDetailViewController()
        let presenter = RestaurantsDetailPresenter(restaurant: restaurant, router: self)
        bind(presenter, with: viewController)

        return viewController
    }

    override func start() {
        let viewController = setup()
        parentNavigationController?.pushViewController(viewController, animated: true)
    }
    
    override func close() {
        parentNavigationController?.popViewController(animated: true)
    }
}

extension RestaurantsDetailCoordinator: RestaurantsDetailRouter { }
