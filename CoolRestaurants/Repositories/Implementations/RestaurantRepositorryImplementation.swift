//
//  RestaurantRepositorryImplementation.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import RxSwift

class RestaurantsRepositoryImplementation: RestaurantsRepository {
    
    func getRestaurants() -> Single<[Restaurant]> {
        return Single.just([])
    }
    
}

