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
    lazy var locationRepository: LocationRepository = { return LocationRepositoryImplementation() }()

    static func provideRestaurantRepository() -> RestaurantRepository {
        return shared.restaurantRepositoy
    }
    
    static func provideLocationRepository() -> LocationRepository {
        return shared.locationRepository
    }
}
