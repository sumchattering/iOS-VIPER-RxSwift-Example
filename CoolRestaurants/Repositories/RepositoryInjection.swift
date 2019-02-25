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
    
    lazy var dataRepository: RestaurantsRepository = { return RestaurantsRepositoryImplementation() }()

    static func provideRestaurantsRepository() -> RestaurantsRepository {
        return shared.dataRepository
    }
}
