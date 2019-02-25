//
//  RestaurantsMapCoordinator.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import UIKit

class RestaurantsMapCoordinator: BaseCoordinator {

    override func setup() -> UIViewController {
        let viewController = RestaurantsMapViewController()
        let restaurantsRepository = RepositoryInjection.provideRestaurantsRepository()
        let presenter = RestaurantsMapPresenter(restaurantsRepository: restaurantsRepository, router: self)
        bind(presenter, with: viewController)
        
        return viewController
    }

    override func start() {
        let viewController = self.setup()
     
        let navigationController = UINavigationController(rootViewController: viewController)
        self.currentNavigationController = navigationController
     
        self.parentWindow?.rootViewController = navigationController
        self.parentWindow?.makeKeyAndVisible()
    }
    
}

extension RestaurantsMapCoordinator: RestaurantsMapRouter {
    
    func goToRestaurantDetail(restaurant: Restaurant) {
        RestaurantsDetailCoordinator(restaurant, navigationController: self.currentNavigationController).start()
    }
}
