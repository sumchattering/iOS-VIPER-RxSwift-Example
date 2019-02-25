//
//  RepositoryInjection.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation

class RepositoryInjection {
    
    static let shared: RepositoryInjection = RepositoryInjection()
    
    lazy var restaurantRepositoy: RestaurantRepository = { return RestaurantRepositoryImplementation() }()

    static func provideRestaurantRepository() -> RestaurantRepository {
        return shared.restaurantRepositoy
    }
}
